import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../widgets/profile_avatar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfileCubit(),
      child: const _ProfileView(),
    );
  }
}

class _ProfileView extends StatelessWidget {
  const _ProfileView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgLight,
      appBar: LuxeAppBar(),
      body: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is ProfileLoggedOut) {
            context.go('/login');
          }
        },
        builder: (context, state) {
          if (state is ProfileLoading) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            );
          }

          if (state is ProfileLoaded) {
            final profile = state.profile;

            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  SizedBox(height: 10.h),
                  // Avatar
                  ProfileAvatar(
                    imageUrl: profile.avatarUrl,
                    onEdit: () {
                      // Navigate to edit profile
                    },
                  ),
                  SizedBox(height: 10.h),
                  // Welcome Text
                  Text(
                    'Welcome, ${profile.name}',
                    style: AppTextStyles.headlineMedium.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    '${profile.memberTier} Member since ${profile.memberSince}',
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  // Stats Row
                  Row(
                    children: [
                      StatsCard(
                        label: 'ACTIVE ORDERS',
                        value: profile.activeOrders.toString().padLeft(2, '0'),
                      ),
                      SizedBox(width: 16.w),
                      StatsCard(
                        label: 'REWARD POINTS',
                        value: '${profile.rewardPoints.toString()},240',
                        valueColor: AppColors.primary,
                      ),
                    ],
                  ),
                  SizedBox(height: 25.h),
                  // Menu Items
                  ...state.menuItems.map((item) {
                    return ProfileMenuItemWidget(
                      item: item,
                      onTap: () {
                        if (item.route != null) {
                          context.push(item.route!);
                        }
                      },
                    );
                  }),
                  // Logout Button
                  AppButton(
                    label: 'Logout',
                    isOutlined: true,
                    color: AppColors.error,
                    icon: Icon(
                      Icons.logout_rounded,
                      color: AppColors.error,
                      size: 18.sp,
                    ),
                    onTap: () => _showLogoutDialog(context),
                  ),
                  SizedBox(height: 50.h),
                ],
              ),
            );
          }

          if (state is ProfileError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline_rounded,
                    size: 48.sp,
                    color: AppColors.error,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    state.message,
                    style: AppTextStyles.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        title: Text(
          'Logout',
          style: AppTextStyles.headlineSmall,
        ),
        content: Text(
          'Are you sure you want to logout?',
          style: AppTextStyles.bodyLarge,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Cancel',
              style: AppTextStyles.bodyLarge.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              context.read<ProfileCubit>().logout();
            },
            child: Text(
              'Logout',
              style: AppTextStyles.bodyLarge.copyWith(
                color: AppColors.error,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}