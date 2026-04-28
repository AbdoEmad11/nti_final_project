// ============================================
// lib/features/profile/data/cubits/profile_state.dart
// ============================================

part of 'profile_cubit.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object?> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final ProfileModel profile;
  final List<ProfileMenuItem> menuItems;

  const ProfileLoaded({
    required this.profile,
    required this.menuItems,
  });

  @override
  List<Object?> get props => [profile, menuItems];
}

class ProfileError extends ProfileState {
  final String message;

  const ProfileError(this.message);

  @override
  List<Object?> get props => [message];
}

class ProfileLoggingOut extends ProfileState {}

class ProfileLoggedOut extends ProfileState {}