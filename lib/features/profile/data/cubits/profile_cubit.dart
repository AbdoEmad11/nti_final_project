// ============================================
// lib/features/profile/data/cubits/profile_cubit.dart
// ============================================

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../models/profile_model.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial()) {
    loadProfile();
  }

  void loadProfile() {
    emit(ProfileLoading());

    // Mock data matching the screenshot
    final profile = const ProfileModel(
      name: 'Alex',
      email: 'alex.thorne@email.com',
      avatarUrl: 'https://i.pravatar.cc/150?img=11',
      memberSince: '2022',
      memberTier: 'Gold',
      activeOrders: 3,
      rewardPoints: 1240,
    );

    final menuItems = [
      const ProfileMenuItem(
        title: 'Add Product',
        icon: Icons.shopping_bag_outlined,
        iconColor: Color(0xFF6366F1),
        iconBackgroundColor: Color(0xFFEEF2FF),
        route: '/add-product',
      ),
      const ProfileMenuItem(
        title: 'My Wishlist',
        icon: Icons.favorite_outline_rounded,
        iconColor: Color(0xFFEF4444),
        iconBackgroundColor: Color(0xFFFEF2F2),
        route: '/wishlist',
      ),
      const ProfileMenuItem(
        title: 'Shipping Addresses',
        icon: Icons.location_on_outlined,
        iconColor: Color(0xFF6366F1),
        iconBackgroundColor: Color(0xFFEEF2FF),
        route: '/addresses',
      ),
      const ProfileMenuItem(
        title: 'Payment Methods',
        icon: Icons.credit_card_outlined,
        iconColor: Color(0xFF6366F1),
        iconBackgroundColor: Color(0xFFEEF2FF),
        route: '/payment-methods',
      ),
      const ProfileMenuItem(
        title: 'Settings',
        icon: Icons.settings_outlined,
        iconColor: Color(0xFF6B7280),
        iconBackgroundColor: Color(0xFFF3F4F6),
        route: '/settings',
      ),
      const ProfileMenuItem(
        title: 'Help Center',
        icon: Icons.help_outline_rounded,
        iconColor: Color(0xFF6B7280),
        iconBackgroundColor: Color(0xFFF3F4F6),
        route: '/help',
      ),
    ];

    emit(ProfileLoaded(profile: profile, menuItems: menuItems));
  }

  void logout() {
    emit(ProfileLoggingOut());
    // Simulate API call
    Future.delayed(const Duration(seconds: 1), () {
      emit(ProfileLoggedOut());
    });
  }
}