# Luxe E-Commerce App

## Overview
Luxe is a modern Flutter e-commerce application focused on clean UI, smooth user experience, and scalable architecture.  
It includes authentication, product discovery, categories, cart, checkout flow UI, profile management, and full Light/Dark mode support with a centralized theme system.

## Features
- Splash screen
- Onboarding
- Login
- Register
- Forgot password
- OTP verification
- Reset password
- Home products
- Categories
- Offers
- Product details
- Add to cart
- Cart management
- Checkout UI
- Profile
- Change password
- Logout
- Privacy & Policy
- About Us
- Contact Us
- Light/Dark mode

## Screens Included
- `SplashScreen`
- `OnboardingScreen`
- `LoginScreen`
- `RegisterScreen`
- `ForgotPasswordScreen`
- `OtpVerificationScreen`
- `ResetPasswordScreen`
- `HomeScreen`
- `CategoriesScreen`
- `ProductDetailsScreen`
- `CartScreen`
- `CheckoutScreen`
- `ProfileScreen`
- `ChangePasswordScreen`
- `InfoScreen` (Privacy & Policy / About Us / Contact Us)

## Tech Stack
- Flutter
- Dart
- `flutter_bloc`
- Dio
- SharedPreferences
- `flutter_screenutil`
- `flutter_svg`
- `cached_network_image`

## Architecture
The project follows a feature-first structure with reusable core modules:

- **Feature-based modules**: each feature owns its screens, state, and data logic.
- **Core layer**: shared infrastructure (routing, networking, storage, styles, reusable widgets, theme).
- **Data layer**: models and remote data sources for API communication.
- **State management**: Cubit/BLoC for screen state and business flow orchestration.
- **Reusable widgets**: shared UI building blocks in `core/widgets`.
- **Centralized theme**: `AppTheme`, `ThemeCubit`, `AppThemeExtension`, and context helpers for semantic colors.

## Project Structure
```text
lib/
  core/
    network/
    storage/
    styling/
    theme/
    utils/
    widgets/
  features/
    auth/
    home/
    product/
    cart/
    profile/
    onboarding/
    main_layout/
  main.dart
```

## API
Base URL:  
`https://accessories-eshop.runasp.net/api`

The API is used for:
- Authentication
- Products
- Categories
- Offers
- Password actions

## Authentication Flow
1. User logs in or registers.
2. OTP verification is used for account confirmation and password recovery.
3. Session/token is persisted using SharedPreferences-based storage.
4. User is redirected to the main layout after successful authentication.

## Cart Flow
1. User adds products from product listings/details.
2. Cart state is managed via `CartCubit`.
3. User can review cart items and totals.
4. Checkout UI presents address, payment methods, and order summary.

## Theme System
Luxe uses a centralized semantic theming approach:

- `AppTheme` defines `lightTheme` and `darkTheme`.
- `ThemeCubit` controls `ThemeMode` and persists user preference.
- `AppThemeExtension` provides semantic colors:
  - background/surface/surfaceVariant
  - textPrimary/textSecondary/textMuted
  - border/inputFill/softPrimary
  - status colors and shadow
- `context_theme_extension.dart` adds helpers:
  - `context.isDark`
  - `context.colors`
  - `context.appTheme`
  - `context.textStyles`

This enables consistent design tokens across screens and widgets with minimal hardcoded colors.

## Light / Dark Mode Support
- Light mode keeps Luxe’s clean visual identity with white surfaces and soft purple accents.
- Dark mode uses readable contrast with:
  - dark scaffold background
  - elevated card/surface layers
  - subtle borders
  - accessible text hierarchy
- User theme choice is persisted locally with SharedPreferences.

## Getting Started
```bash
flutter pub get
flutter run
```

## Requirements
- Flutter SDK
- Dart SDK
- Android Studio or VS Code
- Android emulator or physical device

## Assets
- SVG and raster assets are stored in the `assets/` directory.
- Product/category/offer media may come from remote URLs.

## Packages Used
- `flutter_bloc`
- `dio`
- `shared_preferences`
- `flutter_screenutil`
- `flutter_svg`
- `cached_network_image`

## Current Limitations / Future Improvements
- Full API cart integration
- Orders API integration
- Payment gateway integration
- Wishlist support
- Profile editing enhancements
- Image upload for add product
- Improved localization and translations

## Screenshots
<!-- Add screenshots here -->

## Author
Developed by: Abdelrahman Emad
