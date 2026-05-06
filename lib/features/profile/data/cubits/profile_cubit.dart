import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/storage/token_storage.dart';
import '../models/profile_model.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial()) {
    loadProfile();
  }

  Future<void> loadProfile() async {
    emit(ProfileLoading());

    try {
      final savedName = await TokenStorage.getUserName();
      final savedEmail = await TokenStorage.getUserEmail();
      final savedPhoto = await TokenStorage.getUserPhoto();

      final profile = ProfileModel(
        name: savedName == null || savedName.isEmpty ? 'Luxe User' : savedName,
        email: savedEmail == null || savedEmail.isEmpty
            ? 'user@email.com'
            : savedEmail,
        avatarUrl: savedPhoto == null || savedPhoto.isEmpty
            ? 'https://i.pravatar.cc/150?img=11'
            : savedPhoto,
        memberSince: '2026',
        memberTier: 'Premium',
        activeOrders: 0,
        rewardPoints: 0,
      );

      final menuItems = [
        const ProfileMenuItem(
          title: 'Change Password',
          icon: Icons.lock_outline_rounded,
          iconColor: Color(0xFF6366F1),
          iconBackgroundColor: Color(0xFFEEF2FF),
          route: '/change-password',
        ),
        const ProfileMenuItem(
          title: 'Add Product',
          icon: Icons.add_box_outlined,
          iconColor: Color(0xFF4D41DF),
          iconBackgroundColor: Color(0xFFF5F3FF),
          route: '/add-product',
        ),
        const ProfileMenuItem(
          title: 'Privacy & Policy',
          icon: Icons.privacy_tip_outlined,
          iconColor: Color(0xFF10B981),
          iconBackgroundColor: Color(0xFFECFDF5),
          route: '/privacy-policy',
        ),
        const ProfileMenuItem(
          title: 'About Us',
          icon: Icons.info_outline_rounded,
          iconColor: Color(0xFFF59E0B),
          iconBackgroundColor: Color(0xFFFFFBEB),
          route: '/about-us',
        ),
        const ProfileMenuItem(
          title: 'Contact Us',
          icon: Icons.support_agent_rounded,
          iconColor: Color(0xFFEF4444),
          iconBackgroundColor: Color(0xFFFEF2F2),
          route: '/contact-us',
        ),
      ];

      emit(ProfileLoaded(profile: profile, menuItems: menuItems));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  Future<void> logout() async {
    emit(ProfileLoggingOut());

    await TokenStorage.clearSession();

    emit(ProfileLoggedOut());
  }
}