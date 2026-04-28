class OnboardingModel {
  final int id;
  final String title;
  final String description;
  final String buttonLabel;
  final bool isCompleted;

  OnboardingModel({
    required this.id,
    required this.title,
    required this.description,
    required this.buttonLabel,
    this.isCompleted = false,
  });

  // Copy with method for state updates
  OnboardingModel copyWith({
    int? id,
    String? title,
    String? description,
    String? buttonLabel,
    bool? isCompleted,
  }) {
    return OnboardingModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      buttonLabel: buttonLabel ?? this.buttonLabel,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}