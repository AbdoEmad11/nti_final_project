import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nti_final_project/core/styling/app_colors2.dart';
import 'package:nti_final_project/core/styling/app_styles.dart';
import 'package:nti_final_project/features/auth/data/validators.dart';
import 'package:nti_final_project/features/auth/view/widgets/custom_text_field.dart';
import 'package:nti_final_project/features/auth/view/widgets/primary_button_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formkey = GlobalKey<FormState>();
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  bool isChecked = false;
  bool value = false;
  bool isPassword = true;
  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,

              key: formkey,
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
                  SizedBox(height: 20.h),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Create Account',
                          style: AppStyles.headtitlesStyles,
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          'Join our exclusive community today.',
                          style: AppStyles.subtitlesStyles,
                        ),
                        SizedBox(height: 24.h),
                        CustomTextField(
                          labelText: 'Full Name',
                          hintText: 'Enter your name',
                          validator: (value) {
                            return Validators.validateName(value!);
                          },
                        ),
                        SizedBox(height: 20.h),
                        CustomTextField(
                          labelText: 'Email Address',
                          hintText: 'Enter your email address',
                          validator: (value) {
                            return Validators.validateEmail(value!);
                          },
                        ),
                        SizedBox(height: 20.h),
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
                          validator: (value) {
                            return Validators.validatePassword(
                              value!,
                              passwordController,
                              confirmPasswordController,
                            );
                          },
                        ),
                        SizedBox(height: 20.h),
                        CustomTextField(
                          labelText: 'Confirm Password',
                          hintText: 'Confirm your password',
                          isPassword: isPassword,
                          validator: (value) {
                            return Validators.validatePassword(
                              value!,
                              passwordController,
                              confirmPasswordController,
                            );
                          },
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
                        SizedBox(height: 10.h),
                        PrimaryButtonWidget(
                          onPressed: () {},
                          buttonText: 'Create Account',
                          textColor: Colors.white,
                          buttonColor: AppColors2.primaryColor,
                        ),
                        SizedBox(height: 20.h),
                        Center(
                          child: RichText(
                            text: TextSpan(
                              text: 'Already have an account? ',
                              style: AppStyles.subtitlesStyles,
                              children: [
                                TextSpan(
                                  text: 'Login',
                                  style: AppStyles.subtitlesStyles.copyWith(
                                    color: AppColors2.primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(width: 90.w, child: Divider()),
                      SizedBox(width: 16),
                      Text(
                        'OR SIGN UP WITH',
                        style: AppStyles.gray16W600Styles,
                      ),
                      SizedBox(width: 16),
                      SizedBox(width: 90.w, child: Divider()),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 56.h,
                          width: 167.w,
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
                      Spacer(),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 56.h,
                          width: 167.w,
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
                    ],
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
