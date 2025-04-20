import 'package:flutter/material.dart';
import 'package:flutter_railway_app/screens/login/login_model.dart';
import 'package:flutter_railway_app/screens/login/login_model_impl.dart';
import 'package:flutter_railway_app/widgets/button.dart';
import 'package:flutter_railway_app/widgets/login_with_other_platform_button.dart';
import 'package:flutter_railway_app/widgets/text_field.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatelessWidget {
  final LoginModel model = LoginModel();
  final LoginModelImpl modelImpl = LoginModelImpl();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return 
   Scaffold(
  body: SingleChildScrollView(
    child: Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              child: SvgPicture.asset("assets/images/login/login1.svg", fit: BoxFit.cover,),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.5,
              
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.3,
              child: const Text(
                "Login",
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        TextFieldWidget(
          label: "Enter your email",
          controller: model.emailController,
        ),
        TextFieldWidget(
          label: "Enter your password",
          controller: model.passwordController,
        ),
        CustomButton(text: model.loginButtonText, onPressed: modelImpl.onPressed),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            LoginWithOtherPlatformsButton(model.googleButtonText, model.googleImage),
            LoginWithOtherPlatformsButton(model.facebookButtonText, model.facebookImage)
          ],
          
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Don't have an account?"),
            TextButton(
              onPressed: () {},
              child: const Text("Register new account"),
            ),
          ],
        )
        
      ],
    ),
  ),
);
  }}
