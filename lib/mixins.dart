mixin ValidationMixin {
  bool isEmailValid(String email) {
    return email.contains('@');
  }

  bool isPasswordStrong(String password) {
    return password.length > 6;
  }
}

class LoginForm with ValidationMixin {
  String email = 'test@example.com';
  String password = '12345678';

  void validate() {
    if (isEmailValid(email) && isPasswordStrong(password)) {
      print('Valid login details!');
    } else {
      print('Invalid login details.');
    }
  }
}

void main() {
  LoginForm loginForm = LoginForm();
  loginForm.validate();
}