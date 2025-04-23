import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_railway_app/helper_funtions/navigation_helper.dart';
import 'package:flutter_railway_app/login_bloc/login_bloc.dart';
import 'package:flutter_railway_app/login_bloc/login_state.dart';
import 'package:flutter_railway_app/screens/login/login_model.dart';
import 'package:flutter_railway_app/screens/login/login_model_impl.dart';
import 'package:flutter_railway_app/widgets/button.dart';
import 'package:flutter_railway_app/widgets/login_with_other_platform_button.dart';
import 'package:flutter_railway_app/widgets/show_snack_bar.dart';
import 'package:flutter_railway_app/widgets/text_field.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatelessWidget {
  final LoginModel model = LoginModel.instance;
  final LoginModelImpl modelImpl = LoginModelImpl.ins;

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return 
   Scaffold(
  body: SingleChildScrollView(
    child: BlocBuilder<LoginBloc, LoginState>(
  builder: (BuildContext context, LoginState state) {
    if (state is LoginSuccess) {

      WidgetsBinding.instance.addPostFrameCallback((_) {
        navigateTo(context, "/home");
      });
    } else if (state is LoginFailure) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ShowSnackBar.show(context, state.error, Colors.red);
      });
    }

    return Stack(
      children: [
        Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  child: SvgPicture.asset("assets/images/login/login1.svg", fit: BoxFit.cover),
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
              isPasswordField: true,
            ),
            CustomButton(
              text: model.loginButtonText,
              onPressed: () => modelImpl.onPressed(context),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                LoginWithOtherPlatformsButton(model.googleButtonText, model.googleImage),
                LoginWithOtherPlatformsButton(model.facebookButtonText, model.facebookImage),
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
            ),
          ],
        ),
        if (state is LoginLoading)
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.5),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
      ],
    );
  },
)
,
  ),
);
  }}
