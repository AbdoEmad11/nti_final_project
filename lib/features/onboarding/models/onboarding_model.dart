// ============================================
// lib/features/onboarding/data/models/onboarding_model.dart
// ============================================

import 'package:equatable/equatable.dart';

class OnboardingModel extends Equatable {
  final String imageUrl;
  final String title;
  final String description;

  const OnboardingModel({
    required this.imageUrl,
    required this.title,
    required this.description,
  });

  @override
  List<Object?> get props => [imageUrl, title, description];
}