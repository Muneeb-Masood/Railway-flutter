import 'package:flutter/material.dart';

abstract class LoginEvent {}

class LoginButtonPressed extends LoginEvent {
  final String email;
  final String password;

  LoginButtonPressed({required this.email, required this.password});

}

class RegisterButtonPressed extends LoginEvent {
  final BuildContext context;
  RegisterButtonPressed({required this.context});
}

class LoginSuccess extends LoginEvent {}
class LoginFailure extends LoginEvent {
  final String error;

  LoginFailure({required this.error});
}




