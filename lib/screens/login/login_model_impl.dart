import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_railway_app/login_bloc/login_bloc.dart';
import 'package:flutter_railway_app/login_bloc/login_event.dart';
import 'login_model.dart';

class LoginModelImpl {
  final LoginModel model = LoginModel.instance;
  void onPressed(BuildContext context) {
    final email = model.emailController.text.trim();
    final password = model.passwordController.text.trim();

    // Dispatch the event
    context.read<LoginBloc>().add(
      LoginButtonPressed(email: email, password: password),
    );
  }
}
