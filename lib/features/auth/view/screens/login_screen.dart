import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nti_final_project/core/styling/app_colors2.dart';
import 'package:nti_final_project/core/styling/app_styles.dart';
import 'package:nti_final_project/features/auth/view/widgets/custom_text_field.dart';
import 'package:nti_final_project/features/auth/view/widgets/primary_button_widget.dart';

import '../../../../core/utils/app_routs.dart';

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
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SizedBox(
            width: 350.w,
            child: SingleChildScrollView(
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
                  SizedBox(height: 8.h),

                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.forgotPassword);
                      },
                      child: Text(
                        'Forgot password?',
                        style: TextStyle(color: AppColors2.primaryColor),
                      ),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  PrimaryButtonWidget(
                    buttonText: 'Sign In',
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, AppRoutes.mainLayout);
                    },
                  ),
                  SizedBox(height: 32.h),
                  Row(
                    children: [
                      SizedBox(width: 100.w, child: Divider()),
                      SizedBox(width: 16),
                      Text('Or Login With', style: AppStyles.gray16W600Styles),
                      SizedBox(width: 16),
                      SizedBox(width: 110.w, child: Divider()),
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
                              color: Color(0xffC7C4D8),
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
                              color: Color(0xffC7C4D8),
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
                              color: Color(0xffC7C4D8),
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
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.register);
                    },
                    child: RichText(
                      text: TextSpan(
                        text: 'Don\'t have an account? ',
                        style: AppStyles.subtitlesStyles,
                        children: [
                          TextSpan(
                            text: 'Sign Up',
                            style: AppStyles.subtitlesStyles.copyWith(
                              color: AppColors2.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
