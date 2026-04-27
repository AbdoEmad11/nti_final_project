


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/app_constants.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CartCubit(),
      child: Scaffold(
        backgroundColor: AppColors.bgWhite,
        appBar: AppBar(
          backgroundColor: AppColors.surfaceLight,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              Icon(
                Icons.menu_rounded,
                color: AppColors.primary,
                size: 24.sp,
              ),
              SizedBox(width: 12.w),
              Text(
                AppConstants.appName,
                style: AppTextStyles.headlineSmall.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.search_rounded,
                color: AppColors.textPrimary,
                size: 24.sp,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}