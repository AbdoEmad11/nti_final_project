import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_final_project/addProduct/views/screens/add_product_screen.dart';
import 'package:nti_final_project/features/auth/view/screens/forgot_password_screen.dart';
import 'package:nti_final_project/features/auth/view/screens/login_screen.dart';
import 'package:nti_final_project/features/auth/view/screens/otp_verification_screen.dart';
import 'package:nti_final_project/features/auth/view/screens/register_screen.dart';
import 'package:nti_final_project/features/auth/view/screens/reset_password_screen.dart';
import 'package:nti_final_project/features/cart/view/screens/checkout_screen.dart';
import 'package:nti_final_project/features/main_layout/main_layout_screen.dart';
import 'package:nti_final_project/features/onboarding/view/screens/onboarding_screen.dart';
import 'package:nti_final_project/features/onboarding/view/screens/splash_screen.dart';
import 'package:nti_final_project/features/product/view/screens/product_details.dart';

import '../../features/auth/cubits/auth_cubit.dart';

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
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
          settings: settings,
        );

      case onboarding:
        return MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
          settings: settings,
        );

      case login:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => AuthCubit(),
            child: const LoginScreen(),
          ),
          settings: settings,
        );

      case register:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => AuthCubit(),
            child: const RegisterScreen(),
          ),
          settings: settings,
        );

      case forgotPassword:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => AuthCubit(),
            child: const ForgotPasswordScreen(),
          ),
          settings: settings,
        );

      case otp:
        final args = _getOtpArguments(settings.arguments);

        return MaterialPageRoute(
          builder: (_) => OtpVerificationScreen(
            email: args.email,
            purpose: args.purpose,
          ),
          settings: settings,
        );

      case resetPassword:
        return MaterialPageRoute(
          builder: (_) => const ResetPasswordScreen(),
          settings: settings,
        );

      case mainLayout:
        return MaterialPageRoute(
          builder: (_) => const MainLayoutScreen(),
          settings: settings,
        );

      case productDetails:
        return MaterialPageRoute(
          builder: (_) => const ProductDetailsScreen(),
          settings: settings,
        );

      case checkout:
        return MaterialPageRoute(
          builder: (_) => const CheckoutScreen(),
          settings: settings,
        );

      case addProduct:
        return MaterialPageRoute(
          builder: (_) => const AddProductScreen(),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder: (_) => UndefinedRouteScreen(routeName: settings.name),
          settings: settings,
        );
    }


  }

  static String _getEmailFromArguments(Object? arguments) {
    if (arguments == null) return '';

    if (arguments is String) {
      return arguments;
    }

    if (arguments is Map<String, dynamic>) {
      return arguments['email']?.toString() ?? '';
    }

    return '';
  }
  static OtpRouteArguments _getOtpArguments(Object? arguments) {
    if (arguments is OtpRouteArguments) {
      return arguments;
    }

    if (arguments is Map<String, dynamic>) {
      return OtpRouteArguments(
        email: arguments['email']?.toString() ?? '',
        purpose: arguments['purpose'] is OtpPurpose
            ? arguments['purpose'] as OtpPurpose
            : OtpPurpose.register,
      );
    }

    if (arguments is String) {
      return OtpRouteArguments(
        email: arguments,
        purpose: OtpPurpose.register,
      );
    }

    return const OtpRouteArguments(
      email: '',
      purpose: OtpPurpose.register,
    );
  }

}

class OtpRouteArguments {
  final String email;
  final OtpPurpose purpose;

  const OtpRouteArguments({
    required this.email,
    required this.purpose,
  });
}


class UndefinedRouteScreen extends StatelessWidget {
  final String? routeName;

  const UndefinedRouteScreen({
    super.key,
    required this.routeName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Route Not Found'),
      ),
      body: Center(
        child: Text(
          'No route defined for: ${routeName ?? 'unknown'}',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}