import 'package:flutter_railway_app/screens/register/register_model.dart';

class RegisterModelImpl {

  RegisterModel model;
  RegisterModelImpl(this.model);

  void onPressed(){
    String email = model.emailController.text;
    String password = model.passwordController.text;
    String confirmPassword = model.confirmPasswordController.text;

    if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      print("Please fill in all fields.");
    } else if (password != confirmPassword) {
      print("Passwords do not match.");
    } else {
      print("Registering with email: $email and password: $password");
    }


  }

}