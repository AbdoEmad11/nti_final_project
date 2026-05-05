import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nti_final_project/core/styling/app_colors2.dart';
import 'package:nti_final_project/core/styling/app_styles.dart';
import 'package:nti_final_project/features/auth/cubits/auth_cubit.dart';
import 'package:nti_final_project/features/auth/data/validators.dart';
import 'package:nti_final_project/features/auth/states/auth_states.dart';
import 'package:nti_final_project/features/auth/view/widgets/back_button_widget.dart';
import 'package:nti_final_project/features/auth/view/widgets/custom_text_field.dart';
import 'package:nti_final_project/features/auth/view/widgets/primary_button_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  GlobalKey<FormState> fromKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Form(
            key: fromKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BackButtonWidget(),
                SizedBox(height: 32.h),
                Text(
                  'Forgot Password?',
                  style: AppStyles.headtitlesStyles.copyWith(
                    color: AppColors2.primaryColor,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Don\'t worry! It occurs. Please enter the email address linked with your account.',
                  style: AppStyles.subtitlesStyles,
                ),
                SizedBox(height: 32.h),
                CustomTextField(
                  controller: emailController,
                  validator: (value){
                    return Validators.validateEmail(value!);
                  },
                  labelText: 'Enter your email'),
                SizedBox(height: 32.h),
                BlocBuilder<AuthCubit, AuthStates>(
                  builder: (context, state) {
                    if (state is ForgotPasswordLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    }else if(state is ForgotPasswordrSuccessState){
                      if (Navigator.canPop(context)) {
                        Navigator.pop(context);
                      }
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Email Sent Successfully'),
                ));}else if(state is ForgotPasswordFailureState){
                      if (Navigator.canPop(context)) {
                        Navigator.pop(context);
                      }
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Failed to Send Email'),
                 ));
                }
                    return  PrimaryButtonWidget(
                    onPressed: () {
                      if (fromKey.currentState!.validate()) {
                        BlocProvider.of<AuthCubit>(context).forgotPassword(
                          email: emailController.text,
                        );
                      }
                    },
                    buttonText: 'Send Code',
                    buttonColor: AppColors2.primaryColor,
                    textColor: Colors.white,
                  );
                  },
                ),
                Spacer(),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
