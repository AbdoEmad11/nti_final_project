import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nti_final_project/core/styling/app_colors2.dart';
import 'package:nti_final_project/core/styling/app_styles.dart';
import 'package:nti_final_project/features/auth/view/widgets/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isChecked = false;
  bool value = false;
  bool isPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Luxe', style: AppStyles.primaryLineStyle),
                SizedBox(height: 5.h),
                Text(
                  'Step into the future of premium aesthetics.',
                  style: AppStyles.subtitlesStyles,
                ),
                SizedBox(height: 32.h),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Create Account', style: AppStyles.headtitlesStyles),
                      SizedBox(height: 5.h),
                      Text(
                        'Join our exclusive community today.',
                        style: AppStyles.subtitlesStyles,
                      ),
                      SizedBox(height: 24.h),
                      CustomTextField(
                        labelText: 'Full Name',
                        hintText: 'Enter your name',
                      ),
                      SizedBox(height: 36.h),
                      CustomTextField(
                        labelText: 'Email Address',
                        hintText: 'Enter your email address',
                      ),
                      SizedBox(height: 36.h),
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
                      SizedBox(height: 36.h),
                      CustomTextField(
                        labelText: 'Confirm Password',
                        hintText: 'Confirm your password',
                        isPassword: isPassword,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Checkbox(
                            value: isChecked,
                            onChanged: (value) {
                              setState(() {
                                isChecked = value ?? false;
                              });
                            },
                          ),
                          Expanded(
                            child: Text.rich(
                              TextSpan(
                                text: 'I agree to the',
                                style: AppStyles.subtitlesStyles.copyWith(
                                  color: Color(0xff464555),
                                  fontSize: 12.sp,
                                ),

                                children: [
                                  TextSpan(
                                    text: 'Terms of Service',
                                    style: AppStyles.subtitlesStyles.copyWith(
                                      color: AppColors2.primaryColor,
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' and ',
                                    style: AppStyles.subtitlesStyles.copyWith(
                                      color: Color(0xff464555),
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Privacy Policy.',
                                    style: AppStyles.subtitlesStyles.copyWith(
                                      color: AppColors2.primaryColor,
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
