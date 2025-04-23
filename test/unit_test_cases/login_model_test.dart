import 'package:flutter/material.dart';
import 'package:flutter_railway_app/screens/login/login_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../mocks.mocks.dart';

void main(){
// class LoginModel{
//  static LoginModel instance = LoginModel._internal();
//   LoginModel._internal();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   String loginButtonText = "Login";
//   String facebookButtonText = "Facebook";
//   String googleButtonText = "Google";
//   String googleImage = "assets/images/login/google.svg";
//   String facebookImage = "assets/images/login/facebook.svg";

// }



  test("testing login button text", (){
    expect(LoginModel.instance.loginButtonText, "Login");
  });


  test("testing facebook button text", (){
    expect(LoginModel.instance.facebookButtonText, "Facebook");
  });

  test("testing google button text", (){
    expect(LoginModel.instance.googleButtonText, "Google");
  });

  test("testing google image", (){
    expect(LoginModel.instance.googleImage, "assets/images/login/google.svg");
  });

  test("testing facebook image", (){
    expect(LoginModel.instance.facebookImage, "assets/images/login/facebook.svg");
  });

  test("testing email controller", (){
    expect(LoginModel.instance.emailController, isA<TextEditingController>());
  });

  test("testing password controller", (){
    expect(LoginModel.instance.passwordController, isA<TextEditingController>());
  });


  test("testing login model instance", (){
    expect(LoginModel.instance, isA<LoginModel>());
  });

  
  


}