import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_railway_app/helper_funtions/navigation_helper.dart';
import 'package:flutter_railway_app/register_bloc/register_bloc.dart';
import 'package:flutter_railway_app/register_bloc/register_state.dart';
import 'package:flutter_railway_app/screens/register/register_model.dart';
import 'package:flutter_railway_app/screens/register/register_model_impl.dart';
import 'package:flutter_railway_app/widgets/button.dart';
import 'package:flutter_railway_app/widgets/show_snack_bar.dart';
import 'package:flutter_railway_app/widgets/text_field.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterScreen extends StatelessWidget {
  final RegisterModel model = RegisterModel();
  late final RegisterModelImpl modelImpl;

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    modelImpl = RegisterModelImpl(model);
    return 
   Scaffold(
  body: BlocListener<RegisterBloc, RegisterState>(
    listener: (context, state){
      if (state is RegisterFailureState) {
        ShowSnackBar.show(context, state.errorMessage, Colors.yellow);
      } else if (state is RegisterSuccessState) {
        ShowSnackBar.show(context, state.message, Colors.greenAccent);
        modelImpl.clearCOntrollers();
        Future.delayed(const Duration(seconds: 2), () {
          navigateTo(context, "/home");
        });
      }
      else if (state is RegisterLoadingState) {
        ShowSnackBar.show(context, "Loading...", Colors.blueAccent);
      }
      else{
        navigateTo(context, "/home");
      }

    },
    child: BlocBuilder<RegisterBloc,RegisterState>(
      builder: (context, state) {
        // if (state is RegisterLoadingState) {
        //   return const Center(child: CircularProgressIndicator());
        // } else if (state is RegisterFailureState) {
        //    ShowSnackBar.show(context, "Error occur while regitering", Colors.redAccent);
        // } else if (state is RegisterSuccessState) {
        //   navigateTo(context, "/home");
        //       }
        return SingleChildScrollView(
          
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: SvgPicture.asset("assets/images/login/login1.svg", fit: BoxFit.cover,),
                  
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
              controller: model.cPasswordController,
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
      );
    }),
  ),
);
  }}
