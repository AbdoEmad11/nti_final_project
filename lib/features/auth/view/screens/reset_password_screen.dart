import 'package:flutter/material.dart';
import 'package:nti_final_project/core/theme/context_theme_extension.dart';
import 'package:nti_final_project/core/utils/app_routs.dart';
import 'package:nti_final_project/features/auth/data/auth_remote_data_source.dart';
import 'package:nti_final_project/features/auth/view/widgets/title_text_filed.dart';

class ResetPasswordScreen extends StatefulWidget {
  final String email;
  final String otp;

  const ResetPasswordScreen({
    super.key,
    required this.email,
    required this.otp,
  });

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final AuthRemoteDataSource authRemoteDataSource = AuthRemoteDataSource();

  bool isLoading = false;

  String? validatePassword(String? value) {
    final password = value ?? '';

    if (password.isEmpty) {
      return 'New password is required';
    }

    if (password.length < 8) {
      return 'Password must be at least 8 characters';
    }

    if (!RegExp(r'[A-Z]').hasMatch(password)) {
      return 'Password must contain at least one uppercase letter';
    }

    if (!RegExp(r'[a-z]').hasMatch(password)) {
      return 'Password must contain at least one lowercase letter';
    }

    if (!RegExp(r'\d').hasMatch(password)) {
      return 'Password must contain at least one number';
    }

    if (!RegExp(r'[@$!%*?&]').hasMatch(password)) {
      return 'Password must contain at least one special character';
    }

    return null;
  }

  String? validateConfirmPassword(String? value) {
    final confirmPassword = value ?? '';

    if (confirmPassword.isEmpty) {
      return 'Confirm password is required';
    }

    if (confirmPassword != passwordController.text) {
      return 'Passwords do not match';
    }

    return null;
  }

  Future<void> resetPassword() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    if (widget.email.isEmpty || widget.otp.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Email or OTP not found. Please try again.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      final response = await authRemoteDataSource.resetPassword(
        email: widget.email.trim(),
        otp: widget.otp.trim(),
        newPassword: passwordController.text.trim(),
      );

      if (!mounted) return;

      setState(() {
        isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            response['message']?.toString() ?? 'Password reset successfully',
          ),
          backgroundColor: Colors.green,
        ),
      );

      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoutes.login,
            (route) => false,
      );
    } catch (error) {
      if (!mounted) return;

      setState(() {
        isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            error.toString().replaceFirst('Exception: ', ''),
          ),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  void dispose() {
    passwordController.dispose();
    confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final emailText = widget.email.isEmpty ? 'No email provided' : widget.email;

    return Scaffold(
      backgroundColor: context.appTheme.softPrimary,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_outlined,
            color: Color(0xff4D41DF),
          ),
        ),
        backgroundColor: context.appTheme.surface,
        title: Text(
          'Reset Password',
          style: TextStyle(
            color: context.appTheme.textPrimary,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),

                Center(
                  child: Container(
                    width: 128,
                    height: 128,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: context.appTheme.surface,
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xff4D41DF).withOpacity(0.12),
                          blurRadius: 24,
                          offset: const Offset(0, 12),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.lock_reset_rounded,
                      size: 60,
                      color: Color(0xff4D41DF),
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                Center(
                  child: Text(
                    'Create New Password',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: context.appTheme.textPrimary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                const SizedBox(height: 10),

                Center(
                  child: Text(
                    'Your new password must be strong\nand easy for you to remember',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: context.appTheme.textSecondary,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                Center(
                  child: Text(
                    emailText,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xff4D41DF),
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                TitleTextFiled(
                  title: 'New Password',
                  myController: passwordController,
                  validator: validatePassword,
                ),

                const SizedBox(height: 20),

                TitleTextFiled(
                  title: 'Confirm Password',
                  myController: confirmController,
                  validator: validateConfirmPassword,
                ),

                const SizedBox(height: 30),

                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff4D41DF),
                      disabledBackgroundColor:
                      const Color(0xff4D41DF).withOpacity(0.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    onPressed: isLoading ? null : resetPassword,
                    child: isLoading
                        ? const SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                        : const Text(
                      'Reset Password',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 80),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Remember password?',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: context.appTheme.textSecondary,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          AppRoutes.login,
                              (route) => false,
                        );
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff4D41DF),
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
    );
  }
}