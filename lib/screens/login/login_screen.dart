import 'package:flutter/material.dart';
import 'package:flutter_railway_app/screens/login/login_model.dart';
import 'package:flutter_railway_app/widgets/text_field.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatelessWidget {
  final LoginModel model = LoginModel();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true, // Ensures content adjusts on keyboard open
        body: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                SvgPicture.asset(
                  "assets/images/login/login1.svg",
                  // width: double.infinity,
                  // fit: BoxFit.cover,
                ),
                const Positioned(
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  TextFieldWidget(
                    label: "Email",
                    hintText: "Enter your email",
                    controller: model.loginController,
                    // isEmailField: true,
                  ),
                  TextFieldWidget(
                    label: "Password",
                    hintText: "Enter your password",
                    controller: model.loginController,
                    isPasswordField: true,
                  ),
                  TextFieldWidget(
                    label: "Phone",
                    hintText: "Enter your phone number",
                    controller: model.loginController,
                    // isPhoneField: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
