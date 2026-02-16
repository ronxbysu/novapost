class ValidationUtils {
  static String? validateEmail(String? email) {
    if (email == null || email.trim().isEmpty) {
      return 'Email is required';
    }
    
    final trimmedEmail = email.trim();
    
    // Basic email format validation
    final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!emailRegex.hasMatch(trimmedEmail)) {
      return 'Please enter a valid email address';
    }
    
    return null; // No error
  }
  
  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password is required';
    }
    
    if (password.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    
    return null; // No error
  }
  
  static String? validateConfirmPassword(String? password, String? confirmPassword) {
    final passwordError = validatePassword(password);
    if (passwordError != null) {
      return passwordError;
    }
    
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'Please confirm your password';
    }
    
    if (password != confirmPassword) {
      return 'Passwords do not match';
    }
    
    return null; // No error
  }
  
  static bool isValidEmail(String email) {
    return validateEmail(email) == null;
  }
  
  static bool isValidPassword(String password) {
    return validatePassword(password) == null;
  }
  
  static bool isValidLoginForm(String email, String password) {
    return isValidEmail(email) && isValidPassword(password);
  }
  
  static bool isValidRegistrationForm(String email, String password, [String? confirmPassword]) {
    if (confirmPassword != null) {
      return isValidEmail(email) && 
             isValidPassword(password) && 
             validateConfirmPassword(password, confirmPassword) == null;
    }
    return isValidEmail(email) && isValidPassword(password);
  }
} 