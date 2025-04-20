import 'package:flutter/material.dart';
class LoginModel{
 static LoginModel instance = LoginModel._internal();
  LoginModel._internal();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String loginButtonText = "Login";
  String facebookButtonText = "Facebook";
  String googleButtonText = "Google";
  String googleImage = "assets/images/login/google.svg";
  String facebookImage = "assets/images/login/facebook.svg";

}