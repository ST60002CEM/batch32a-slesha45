class SignUpModel {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String confirmPassword;

  SignUpModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  String? validateFirstName() {
    if (firstName.isEmpty) {
      return 'First name can\'t be empty';
    }
    return null;
  }

  String? validateLastName() {
    if (lastName.isEmpty) {
      return 'Last name can\'t be empty';
    }
    return null;
  }

  String? validateEmail() {
    if (email.isEmpty) {
      return 'Email can\'t be empty';
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(email)) {
      return 'Enter a valid email';
    }
    return null;
  }

  String? validatePassword() {
    if (password.isEmpty) {
      return 'Password can\'t be empty';
    }
    if (password.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  String? validateConfirmPassword() {
    if (confirmPassword.isEmpty) {
      return 'Confirm password can\'t be empty';
    }
    if (confirmPassword != password) {
      return 'Passwords do not match';
    }
    return null;
  }
}
