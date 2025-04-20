import 'package:flutter/material.dart';
import 'package:flutter_railway_app/screens/register/register_model.dart';
import 'package:flutter_railway_app/screens/register/register_model_impl.dart';
import 'package:flutter_railway_app/widgets/button.dart';
import 'package:flutter_railway_app/widgets/text_field.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterScreen extends StatelessWidget {
  final RegisterModel model = RegisterModel();
  final RegisterModelImpl modelImpl = RegisterModelImpl(RegisterModel());

  RegisterScreen({super.key});

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
                "Register",
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
          label: "Enter  your password",
          controller: model.passwordController,
        ),
        TextFieldWidget(
          label: "Enter your confirm password",
          controller: model.confirmPasswordController,
        ),
        CustomButton(text: model.registerButtonText, onPressed: modelImpl.onPressed),
      

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Already have an account?"),
            TextButton(
              onPressed: () {},
              child: const Text("Login"),
            ),
          ],
        )
        
      ],
    ),
  ),
);
  }}
