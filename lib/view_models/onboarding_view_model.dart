import 'package:flutter/material.dart';
import '../models/onboarding_model.dart';

class OnboardingViewModel extends ChangeNotifier {
  late List<OnboardingModel> _onboardingSteps;
  int _currentIndex = 0;

  List<OnboardingModel> get onboardingSteps => _onboardingSteps;
  int get currentIndex => _currentIndex;
  OnboardingModel get currentStep => _onboardingSteps[_currentIndex];
  bool get isLastStep => _currentIndex == _onboardingSteps.length - 1;
  bool get isFirstStep => _currentIndex == 0;

  OnboardingViewModel() {
    _initializeSteps();
  }

  void _initializeSteps() {
    _onboardingSteps = [
      OnboardingModel(
        id: 1,
        title: 'Find Your Styie',
        description: 'Discover the latest trends in fashion\n    and electronics    ',
        buttonLabel: 'Next',
      ),
      OnboardingModel(
        id: 2,
        title: 'Easy Checkout',
        description: 'Secure and fast payment methods \n   for your convenience   ',
        buttonLabel: 'Next',
      ),
      OnboardingModel(
        id: 3,
        title: 'Fast Delivery',
        description: 'Get your orders delivered to your \n   doorstep in no time   ',
        buttonLabel: 'Get Started',
      ),
    ];
  }

  void nextStep() {
    if (!isLastStep) {
      _currentIndex++;
      notifyListeners();
    }
  }

  void previousStep() {
    if (!isFirstStep) {
      _currentIndex--;
      notifyListeners();
    }
  }

  void skipOnboarding() {
    _currentIndex = _onboardingSteps.length - 1;
    notifyListeners();
  }

  void goToStep(int index) {
    if (index >= 0 && index < _onboardingSteps.length) {
      _currentIndex = index;
      notifyListeners();
    }
  }
}