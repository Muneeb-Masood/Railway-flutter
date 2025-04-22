abstract class RegisterState {}
class RegisterInitialState extends RegisterState {}
class RegisterLoadingState extends RegisterState {}
class RegisterFailureState extends RegisterState {
  final String errorMessage;
  RegisterFailureState(this.errorMessage);
}
class RegisterSuccessState extends RegisterState {
  final String message;
  RegisterSuccessState(this.message);
}

