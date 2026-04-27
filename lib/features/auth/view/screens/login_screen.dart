import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nti_final_project/core/styling/app_colors2.dart';
import 'package:nti_final_project/core/styling/app_styles.dart';
import 'package:nti_final_project/features/auth/view/widgets/custom_text_field.dart';
import 'package:nti_final_project/main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 129.h),
              Text('Luxe', style: AppStyles.primaryLineStyle),
              SizedBox(height: 5.h),
              Text('Welcome back', style: AppStyles.headtitlesStyles),
              SizedBox(height: 5.h),
              Text(
                'Enter your details to access your account',
                style: AppStyles.subtitlesStyles,
              ),
              SizedBox(height: 32.h),
              CustomTextField(
                labelText: 'Email Address',
                hintText: 'Enter your email address',
              ),
              SizedBox(height: 24.h),
              CustomTextField(
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

                    color: AppColors2.grayColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
