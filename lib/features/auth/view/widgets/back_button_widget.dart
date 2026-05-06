import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nti_final_project/core/styling/app_colors2.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 41.h,
      height: 41.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: const Color(0xffE8ECF4), width: 1.w),
        color: Colors.white,
      ),
      child: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Icon(
          Icons.arrow_back_ios_new_outlined,
          color: AppColors2.primaryColor,
          size: 18.sp,
        ),
      ),
    );
  }
}