import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nti_final_project/core/theme/context_theme_extension.dart';

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
      backgroundColor: context.isDark
          ? context.appTheme.background
          : context.appTheme.surface,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          if (showMenu)
            Icon(
              Icons.menu_rounded,
              color: context.appTheme.primary,
              size: 24.sp,
            ),
          if (showMenu) SizedBox(width: 12.w),
          Text(
            AppConstants.appName,
            style: AppTextStyles.headlineSmall.copyWith(
              color: context.appTheme.primary,
              fontSize: 25.sp,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
      actions: actions ??
          [
            if (showSearch)
              IconButton(
                icon: Icon(
                  Icons.search_rounded,
                  color: context.appTheme.textPrimary,
                  size: 24.sp,
                ),
                onPressed: () {},
              ),
          ],
    );
  }
}