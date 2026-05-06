class Validators {
  static String? validateEmail(String? email) {
    final value = email?.trim() ?? '';

    if (value.isEmpty) {
      return 'Email is required';
    }

    final regex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
    if (!regex.hasMatch(value)) {
      return 'Invalid email format';
    }

    return null;
  }

  static String? validateName(String? name) {
    if (name!.isEmpty) {
      return 'Name is required';
    }
    return null;
  }

  static String? validatePassword(
    String password,
    dynamic passwordController,
    dynamic confirmPassController,
  ) {
    if (password.isEmpty) {
      return 'Password is required.';
    }
    if (password.length < 8) {
      return 'Password must be at least 8 characters long.';
    }
    if (!RegExp(r'[A-Z]').hasMatch(password)) {
      return 'Password must contain at least one uppercase letter.';
    }
    if (!RegExp(r'[a-z]').hasMatch(password)) {
      return 'Password must contain at least one lowercase letter.';
    }
    if (!RegExp(r'\d').hasMatch(password)) {
      return 'Password must contain at least one number.';
    }
    if (!RegExp(r'[@$!%*?&]').hasMatch(password)) {
      return 'Password must contain at least one special character.';
    }
    if (passwordController.text != confirmPassController.text) {
      return 'Passwords do not match.';
    }
    return null;
  }

  static String? validateLoginPassword(String? password) {
    final value = password?.trim() ?? '';
    if (value.isEmpty) {
      return 'Password is required.';
    }
    return null;
  }
}
