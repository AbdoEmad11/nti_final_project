import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../utils/app_constants.dart';

class LuxeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showMenu;
  final bool showSearch;
  final List<Widget>? actions;

  const LuxeAppBar({
    super.key,
    this.showMenu = true,
    this.showSearch = true,
    this.actions,
  });

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.surfaceLight,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          Icon(Icons.menu_rounded, color: AppColors.primary, size: 24.sp),
          SizedBox(width: 12.w),
          Text(
            AppConstants.appName,
            style: AppTextStyles.headlineSmall.copyWith(
              color: AppColors.primary,
              fontSize: 25.sp,
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
    );
  }
}
