import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_railway_app/blocs/login_bloc/login_bloc.dart';
import 'package:flutter_railway_app/blocs/login_bloc/login_event.dart';
import 'package:flutter_railway_app/helper_funtions/helper_functions.dart';
import 'package:flutter_railway_app/widgets/show_snack_bar.dart';
import 'package:local_auth/local_auth.dart';
import 'login_model.dart';

class LoginModelImpl {
  final LoginModel model = LoginModel.instance;
  void onPressed(BuildContext context) {
    final email = model.emailController.text.trim();
    final password = model.passwordController.text.trim();

    context.read<LoginBloc>().add(
      LoginButtonPressed(email: email, password: password),
    );
  }

  void onRegisterNowPressed(BuildContext context) {
    context.read<LoginBloc>().add(
      RegisterButtonPressed(context: context),
    );
  }

  Future<void> authenticateWithBiometrics(BuildContext context) async {
  final LocalAuthentication auth = LocalAuthentication();
  try {
    final bool canAuthenticate = await auth.canCheckBiometrics || await auth.isDeviceSupported();
    if (!canAuthenticate) {
      ShowSnackBar.show(context, "Biometric not supported on this device", Colors.red);
      return;
    }

    final bool authenticated = await auth.authenticate(
      localizedReason: '',
      options: const AuthenticationOptions(
        stickyAuth: true,
        biometricOnly: true,
      ),
    );

    if (authenticated) {
      HelperFucntions.navigateTo(context, "/home");
      // You can now trigger a login event
      // context.read<LoginBloc>().add(BiometricLoginEvent());
    }
  } catch (e) {
    ShowSnackBar.show(context, "Authentication failed: $e", Colors.red);
  }
}

}
