abstract class RegisterEvent {}

class RegiterButttonClicked extends RegisterEvent {
  final String email;
  final String password;
  final String cPassword;
  RegiterButttonClicked(this.email, this.password, this.cPassword);
}