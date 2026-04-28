import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ProfileModel extends Equatable {
  final String name;
  final String email;
  final String avatarUrl;
  final String memberSince;
  final String memberTier;
  final int activeOrders;
  final int rewardPoints;

  const ProfileModel({
    required this.name,
    required this.email,
    required this.avatarUrl,
    required this.memberSince,
    required this.memberTier,
    required this.activeOrders,
    required this.rewardPoints,
  });

  @override
  List<Object?> get props => [
    name,
    email,
    avatarUrl,
    memberSince,
    memberTier,
    activeOrders,
    rewardPoints,
  ];
}

class ProfileMenuItem extends Equatable {
  final String title;
  final IconData icon;
  final Color iconColor;
  final Color? iconBackgroundColor;
  final String? route;

  const ProfileMenuItem({
    required this.title,
    required this.icon,
    required this.iconColor,
    this.iconBackgroundColor,
    this.route,
  });

  @override
  List<Object?> get props => [title, icon, iconColor, iconBackgroundColor, route];
}