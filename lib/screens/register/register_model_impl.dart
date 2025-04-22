import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_railway_app/register_bloc/register_bloc.dart';
import 'package:flutter_railway_app/register_bloc/register_event.dart';
import 'package:flutter_railway_app/screens/register/register_model.dart';
import 'package:flutter_railway_app/widgets/show_snack_bar.dart';

class RegisterModelImpl {

  RegisterModel model;
RegisterModelImpl(this.model);

  void onPressed(BuildContext context){
    String email = model.emailController.text;
    String password = model.passwordController.text;
    String cPassword = model.cPasswordController.text;


    if(email.isEmpty || password.isEmpty || cPassword.isEmpty) {
      ShowSnackBar.show(context, "Fields can't be empty", Colors.redAccent);
      return; }

    
    else if(!(email.contains('@') && email.contains('.'))) {
      ShowSnackBar.show(context, "Email is not valid", Colors.redAccent);
      return; }

    else if(password != cPassword) {
      ShowSnackBar.show(context, "Password and confirm password do not match", Colors.redAccent);
      return; }

    else if (password.length < 6) {
      ShowSnackBar.show(context, "Password must be at least 6 characters long", Colors.redAccent);
      return; }

else if (!password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>_\-+=]'))) {
      ShowSnackBar.show(context, "Password must contain at least one special character", Colors.redAccent);
      return; }

    
    context.read<RegisterBloc>().add(RegiterButttonClicked(
      email, password, cPassword
    ));


  }

  void clearCOntrollers(){
    model.emailController.clear();
    model.passwordController.clear();
    model.cPasswordController.clear();
  }

}