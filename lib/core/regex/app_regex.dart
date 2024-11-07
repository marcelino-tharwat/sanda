class AppRegex {
  // Check if the email is valid
  static bool isValidEmail(String email) {
    return RegExp(r'^[\w\.-]+@[a-zA-Z\d-]+\.[a-zA-Z]{2,}$').hasMatch(email);
  }

  // Check if the password contains at least one lowercase letter
  static bool hasLowercase(String password) {
    return RegExp(r'[a-z]').hasMatch(password);
  }

  // Check if the password contains at least one uppercase letter
  static bool hasUppercase(String password) {
    return RegExp(r'[A-Z]').hasMatch(password);
  }

  // Check if the password contains at least one number
  static bool hasNumber(String password) {
    return RegExp(r'\d').hasMatch(password);
  }

  // Check if the password meets the minimum length requirement
  static bool hasMinLength(String password) {
    return RegExp(r'.{8,}').hasMatch(password);
  }

  // Check if the password contains at least one special character
  static bool hasSpecialCharacter(String password) {
    return RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password);
  }

  static bool validPhoneNumber(String phoneNumber) {
    return RegExp(r'^(010|012|015)[0-9]{8}$').hasMatch(phoneNumber);
  }
}
