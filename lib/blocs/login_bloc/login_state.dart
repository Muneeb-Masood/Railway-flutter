abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}


class LoginSuccessState extends LoginState {
  final String token;
  final String message;
  LoginSuccessState({required this.token , required this.message});
}


class LoginFailureState extends LoginState {
  final String message;
  LoginFailureState({required this.message});
}

class RegisterButtonPressedState extends LoginState {}



