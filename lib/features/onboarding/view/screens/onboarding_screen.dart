import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../cart/view/screens/cart_screen.dart';
import '../../models/onboarding_model.dart';
import '../widgets/onboarding_page.dart';
import '../widgets/onboarding_page_indicator.dart' show PageIndicator;

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  bool _isLastPage = false;

  final List<OnboardingModel> _pages = const [
    OnboardingModel(
      imageUrl: 'https://images.unsplash.com/photo-1591047139829-d91aecb6caea?w=600',
      title: 'Find Your Style',
      description: 'Discover the latest trends in fashion ',
    ),
    OnboardingModel(
      imageUrl: 'https://images.unsplash.com/photo-1556742049-0cfed4f6a45d?w=600',
      title: 'Easy Checkout',
      description: 'Secure and fast payment methods for your convenience',
    ),
    OnboardingModel(
      imageUrl: 'https://images.unsplash.com/photo-1616432043562-3671ea2e5242?w=600',
      title: 'Fast Delivery',
      description: 'Get your orders delivered to your doorstep in no time',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
        _isLastPage = _currentPage == _pages.length - 1;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_isLastPage) {
      _completeOnboarding();
    } else {
      _pageController.nextPage(
        duration: Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  void _skip() {
    _completeOnboarding();
  }

  void _completeOnboarding() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const CartScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceLight,
      appBar: AppBar(
        backgroundColor: AppColors.surfaceLight,
        automaticallyImplyLeading: false,
        title: Text(
          AppConstants.appName,
          style: AppTextStyles.headlineSmall.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.w800,
            fontSize: 25.sp,
          ),
        ),
        centerTitle: false,
        actions: [
          TextButton(
            onPressed: _skip,
            child: Text(
              'Skip',
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Page View
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _pages.length,
                itemBuilder: (context, index) {
                  return OnboardingPage(data: _pages[index]);
                },
              ),
            ),
            // Bottom Section
            Padding(
              padding: EdgeInsets.all(24.w),
              child: Column(
                children: [
                  PageIndicator(
                    count: _pages.length,
                    currentPage: _currentPage,
                  ),
                  SizedBox(height: 32.h),
                  AppButton(
                    label: _isLastPage ? 'Get Started' : 'Next',
                    icon: Icon(
                      Icons.arrow_forward_rounded,
                      color: Colors.white,
                      size: 20.sp,
                    ),
                    onTap: _nextPage,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}