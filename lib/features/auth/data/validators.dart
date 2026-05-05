class Validators {
  static String? validateEmail(String? email) {
    final regex = RegExp(r'^[a-zA-Z0-9._%+-]{6,}@gmail\.com$');
    if (email!.isEmpty) {
      return 'Email is required';
    } else if (!email.split("@")[0].contains(RegExp(r'^.{6,}$'))) {
      return 'The part before @ must be at least 6 characters ';
    } else if (!regex.hasMatch(email)) {
      if (!email.contains("@gmail.com")) {
        return 'Email must end with @gmail.com';
      } else {
        return 'Invalid email format';
      }
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
}
