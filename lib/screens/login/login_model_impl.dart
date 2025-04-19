import 'package:flutter_railway_app/screens/login/login_model.dart';

class LoginModelImpl{
  LoginModel model = LoginModel();
  void onPressed(){

    String email = model.emailController.text;
    String password = model.passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      print("Please fill in all fields.");
    } else {
      print("Logging in with email: $email and password: $password");
    }
  }

}