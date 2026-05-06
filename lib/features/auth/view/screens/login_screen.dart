import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nti_final_project/core/styling/app_colors2.dart';
import 'package:nti_final_project/core/theme/context_theme_extension.dart';
import 'package:nti_final_project/core/styling/app_styles.dart';
import 'package:nti_final_project/features/auth/cubits/auth_cubit.dart';
import 'package:nti_final_project/features/auth/data/validators.dart';
import 'package:nti_final_project/features/auth/states/auth_states.dart';
import 'package:nti_final_project/features/auth/view/widgets/custom_text_field.dart';

import '../../../../core/utils/app_routs.dart';
import '../../../../core/widgets/app_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Validators validators = Validators();
  final formKey = GlobalKey<FormState>();
  late TextEditingController emailController;
  late TextEditingController passwordController;
  bool isPassword = true;
  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appTheme.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SizedBox(
            width: 350.w,
            child: SingleChildScrollView(
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 129.h),
                    Text('Luxe', style: AppStyles.primaryLineStyle),
                    SizedBox(height: 5.h),
                    Text('Welcome back', style: AppStyles.headtitlesStyle(context)),
                    SizedBox(height: 5.h),
                    Text(
                      'Enter your details to access your account',
                      style: AppStyles.subtitlesStyle(context),
                    ),
                    SizedBox(height: 32.h),
                    CustomTextField(
                      controller: emailController,
                      labelText: 'Email Address',
                      hintText: 'Enter your email address',
                      validator: (value) {
                        return Validators.validateEmail(value!);
                      },
                    ),
                    SizedBox(height: 24.h),
                    CustomTextField(
                      controller: passwordController,
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      isPassword: isPassword,

                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isPassword = !isPassword;
                          });
                        },
                        icon: Icon(
                          isPassword
                              ? Icons.remove_red_eye_outlined
                              : Icons.remove_red_eye,

                          color: context.appTheme.textSecondary,
                        ),
                      ),
                      validator: (value) {
                        return Validators.validateLoginPassword(value);
                      },
                    ),
                    SizedBox(height: 8.h),

                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            AppRoutes.forgotPassword,
                          );
                        },
                        child: Text(
                          'Forgot password?',
                          style: TextStyle(color: AppColors2.primaryColor),
                        ),
                      ),
                    ),
                    SizedBox(height: 24.h),
                    BlocConsumer<AuthCubit, AuthStates>(
                      listener: (context, state) {
                        if (state is LoginSuccessState) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                state.message ?? 'Login successful',
                              ),
                              backgroundColor: Colors.green,
                            ),
                          );

                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            AppRoutes.mainLayout,
                            (route) => false,
                          );
                        }

                        if (state is LoginFailureState) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(state.message),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      },
                      builder: (context, state) {
                        final isLoading = state is LoginLoadingState;

                        return PrimaryButtonWidget(
                          buttonText: 'Sign In',
                          isLoading: isLoading,
                          onPressed: isLoading
                              ? null
                              : () {
                                  if (formKey.currentState!.validate()) {
                                    context.read<AuthCubit>().login(
                                      email: emailController.text.trim(),
                                      password: passwordController.text.trim(),
                                    );
                                  }
                                },
                        );
                      },
                    ),
                    SizedBox(height: 32.h),
                    Row(
                      children: [
                        SizedBox(width: 110.w, child: Divider()),
                        SizedBox(width: 16),
                        Text(
                          'Or Login With',
                          style: AppStyles.gray16W600Style(context),
                        ),
                        SizedBox(width: 16),
                        SizedBox(width: 100.w, child: Divider()),
                      ],
                    ),
                    SizedBox(height: 32.h),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Container(
                            height: 56.h,
                            width: 105.w,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(12.r),
                              border: Border.all(
                                color: context.appTheme.border,
                                width: 1.w,
                              ),
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                'assets/icons/facebook.svg',
                                height: 24.h,
                                width: 12.w,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 16.w),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            height: 56.h,
                            width: 105.w,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(12.r),
                              border: Border.all(
                                color: context.appTheme.border,
                                width: 1.w,
                              ),
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                'assets/icons/google.svg',
                                height: 24.h,
                                width: 12.w,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 16.w),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            height: 56.h,
                            width: 105.w,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(12.r),
                              border: Border.all(
                                color: context.appTheme.border,
                                width: 1.w,
                              ),
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                'assets/icons/apple.svg',
                                height: 24.h,
                                width: 12.w,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 32.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have an account? ',
                          style: AppStyles.subtitlesStyle(context),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, AppRoutes.register);
                          },
                          child: Text(
                            'Sign Up',
                            style: AppStyles.subtitlesStyle(context).copyWith(
                              color: AppColors2.primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
