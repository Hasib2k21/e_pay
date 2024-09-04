
class AppConstants {
  static RegExp emailRegExp = RegExp(
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
  );
  static RegExp mobileRegExp = RegExp(
    r'"/^(?:(?:\+|00)88|01)?\d{11}$/"',
  );
  static RegExp passwordRegExp = RegExp(
    r'^(?=.*[A-Za-z])(?=.*\d).{6,}$',
  );
}

class Validators {
  // Email validation
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email address';
    }
    if (!AppConstants.emailRegExp.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  // Password validation
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    if (!AppConstants.passwordRegExp.hasMatch(value)) {
      return 'Password must contain both letters and numbers';
    }
    return null;
  }

  // Name validation (for Sign-Up)
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }

  // Phone number validation (for Sign-Up)
  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
    }
    if (!AppConstants.mobileRegExp.hasMatch(value)) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  // Confirm Password validation
  static String? validateConfirmPassword(String? value, String? originalPassword) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != originalPassword) {
      return 'Passwords do not match';
    }
    return null;
  }
}

