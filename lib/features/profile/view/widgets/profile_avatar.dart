// ============================================
// lib/features/profile/view/widgets/profile_avatar.dart
// ============================================

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/context_theme_extension.dart';

class ProfileAvatar extends StatelessWidget {
  final String imageUrl;
  final VoidCallback? onEdit;

  const ProfileAvatar({
    super.key,
    required this.imageUrl,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          // Avatar
          Container(
            width: 100.w,
            height: 100.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: context.appTheme.surface,
                width: 4,
              ),
              boxShadow: [
                BoxShadow(
                  color: context.appTheme.shadow,
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: ClipOval(
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
                placeholder: (_, __) => Container(
                  color: context.appTheme.softPrimary,
                  child: Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: context.appTheme.primary,
                    ),
                  ),
                ),
                errorWidget: (_, __, ___) => Container(
                  color: context.appTheme.softPrimary,
                  child: Icon(
                    Icons.person_rounded,
                    size: 40.sp,
                    color: context.appTheme.primary,
                  ),
                ),
              ),
            ),
          ),
          // Edit Badge
          Positioned(
            bottom: 0,
            right: 0,
            child: GestureDetector(
              onTap: onEdit,
              child: Container(
                width: 32.w,
                height: 32.w,
                decoration: BoxDecoration(
                  color: context.appTheme.primary,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: context.appTheme.surface,
                    width: 2,
                  ),
                ),
                child: Icon(
                  Icons.edit_rounded,
                  color: Colors.white,
                  size: 14.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}