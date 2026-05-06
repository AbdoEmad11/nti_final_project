import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_final_project/core/utils/app_routs.dart';
import 'package:nti_final_project/features/auth/data/data_source/remote_data_source.dart';
import 'package:nti_final_project/features/auth/view/cubits/otp_cubit.dart';
import 'package:nti_final_project/features/auth/view/cubits/otp_state.dart';

enum OtpPurpose {
  register,
  forgotPassword,
}

class OtpVerificationScreen extends StatefulWidget {
  final String email;
  final OtpPurpose purpose;

  const OtpVerificationScreen({
    super.key,
    required this.email,
    required this.purpose,
  });

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final List<TextEditingController> controllers = List.generate(
    6,
        (_) => TextEditingController(),
  );

  final ValueNotifier<int> seconds = ValueNotifier<int>(60);
  final AuthRemoteDataSource remote = AuthRemoteDataSource();

  Timer? timer;
  bool isResending = false;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer?.cancel();
    seconds.value = 60;

    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (seconds.value > 0) {
        seconds.value--;
      } else {
        t.cancel();
      }
    });
  }

  String getOtp() {
    return controllers.map((controller) => controller.text.trim()).join();
  }

  bool validateOtp() {
    final otp = getOtp();

    if (otp.length != 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Enter full 6-digit code"),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    }

    return true;
  }

  Future<void> resendOtp() async {
    if (isResending) return;

    setState(() {
      isResending = true;
    });

    final message = await remote.resendOtp(widget.email);

    if (!mounted) return;

    setState(() {
      isResending = false;
    });

    final isError = message.toLowerCase().contains("error") ||
        message.toLowerCase().contains("wrong") ||
        message.toLowerCase().contains("network");

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red : Colors.green,
      ),
    );

    if (!isError) {
      startTimer();
    }
  }

  void _handleOtpSuccess() {
    timer?.cancel();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("OTP verified successfully"),
        backgroundColor: Colors.green,
      ),
    );

    if (widget.purpose == OtpPurpose.register) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoutes.login,
            (route) => false,
      );
    } else {
      Navigator.pushReplacementNamed(
        context,
        AppRoutes.resetPassword,
      );
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    seconds.dispose();

    for (final controller in controllers) {
      controller.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OtpCubit>(
      create: (_) => OtpCubit(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            backgroundColor: const Color(0xffF5F3FF),
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  timer?.cancel();
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_outlined,
                  color: Color(0xff4D41DF),
                ),
              ),
              backgroundColor: Colors.white,
              title: const Text(
                "L U X E",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              centerTitle: true,
            ),
            body: BlocConsumer<OtpCubit, OtpStates>(
              listener: (context, state) {
                if (state is OtpSuccessState) {
                  _handleOtpSuccess();
                }

                if (state is OtpFailureState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.message),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              builder: (context, state) {
                final isLoading = state is OtpIsLoadingState;

                return SafeArea(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 30),
                        Container(
                          width: 128,
                          height: 128,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.white,
                          ),
                          child: const Icon(
                            Icons.verified_user,
                            size: 60,
                            color: Color(0xff4D41DF),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "Verify Your Account",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff1A1B22),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Enter the 6-digit code sent to your email",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff464555),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          widget.email.isEmpty
                              ? "No email provided"
                              : widget.email,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff4D41DF),
                          ),
                        ),
                        const SizedBox(height: 25),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(6, (index) {
                            return SizedBox(
                              width: 45,
                              child: TextFormField(
                                controller: controllers[index],
                                enabled: !isLoading,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                maxLength: 1,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                decoration: InputDecoration(
                                  counterText: "",
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                onChanged: (value) {
                                  if (value.isNotEmpty && index < 5) {
                                    FocusScope.of(context).nextFocus();
                                  }

                                  if (value.isEmpty && index > 0) {
                                    FocusScope.of(context).previousFocus();
                                  }
                                },
                              ),
                            );
                          }),
                        ),

                        const SizedBox(height: 30),

                        SizedBox(
                          width: double.infinity,
                          height: 55,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff4D41DF),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            onPressed: isLoading
                                ? null
                                : () {
                              if (!validateOtp()) return;

                              context.read<OtpCubit>().otpVerify(
                                email: widget.email,
                                getOtp: getOtp(),
                              );
                            },
                            child: isLoading
                                ? const SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                                : const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Verify Code ",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                  size: 25,
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Didn't receive code? ",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            ValueListenableBuilder<int>(
                              valueListenable: seconds,
                              builder: (context, value, child) {
                                return TextButton(
                                  onPressed: value == 0 && !isResending
                                      ? resendOtp
                                      : null,
                                  child: isResending
                                      ? const SizedBox(
                                    width: 16,
                                    height: 16,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                    ),
                                  )
                                      : Text(
                                    value == 0
                                        ? "Resend"
                                        : "Resend (${value}s)",
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff4D41DF),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}