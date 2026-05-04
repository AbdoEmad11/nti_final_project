import 'package:flutter/material.dart';
import 'package:nti_final_project/features/auth/view/screens/forgot_password_screen.dart';
import 'package:nti_final_project/features/auth/view/screens/login_screen.dart';
import 'package:nti_final_project/features/auth/view/screens/otp_screen.dart';
import 'package:nti_final_project/features/auth/view/screens/register_screen.dart';
import 'package:nti_final_project/features/auth/view/screens/reset_password_screen.dart';
import 'package:nti_final_project/features/cart/view/screens/checkout_screen.dart';
import 'package:nti_final_project/features/main_layout/main_layout_screen.dart';
import 'package:nti_final_project/features/onboarding/view/screens/onboarding_screen.dart';
import 'package:nti_final_project/features/onboarding/view/screens/splash_screen.dart';
import 'package:nti_final_project/features/product/view/screens/product_details.dart';

import '../../addProduct/views/screens/add_product_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgot-password';
  static const String otp = '/otp';
  static const String resetPassword = '/reset-password';
  static const String mainLayout = '/main-layout';
  static const String productDetails = '/product-details';
  static const String checkout = '/checkout';
  static const String addProduct = '/add-product';


  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());

      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case register:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());

      case forgotPassword:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());

      case otp:
        return MaterialPageRoute(builder: (_) => const OtpVerificationScreen());

      case resetPassword:
        return MaterialPageRoute(builder: (_) => const ResetPasswordScreen());

      case mainLayout:
        return MaterialPageRoute(builder: (_) => const MainLayoutScreen());

      case productDetails:
        return MaterialPageRoute(builder: (_) => const ProductDetailsScreen());

      case checkout:
        return MaterialPageRoute(builder: (_) => const CheckoutScreen());

      case '/add-product':
        return MaterialPageRoute(builder: (_) => const AddProductScreen());


      default:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
    }
  }
}