import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_railway_app/helper_funtions/helper_functions.dart';
import 'package:flutter_railway_app/blocs/login_bloc/login_event.dart';
import 'package:flutter_railway_app/blocs/login_bloc/login_state.dart';
import 'package:flutter_railway_app/models/login_data_model.dart';
import 'package:http/http.dart' as http;

class LoginBloc extends Bloc<LoginEvent, LoginState>{
  LoginBloc() : super(LoginInitial()){


    on<LoginButtonPressed>((event, emit) async {
      emit(LoginLoading());
      try {
        if(event.email.isEmpty || event.password.isEmpty) {
          emit(LoginFailureState(message: "Email and password cannot be empty"));
          return;
        }
        final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
        if (!emailRegex.hasMatch(event.email)) {
          emit(LoginFailureState(message: "Please enter a valid email address"));
          return;
        }
        if (event.password.length < 6) {
          emit(LoginFailureState(message: "Password must be at least 6 characters long"));
          return;
        }
        

        Uri uri = Uri.parse("http://localhost:5000/api/passengers/login");
        final response = await http.post(uri, body: {
          "email": event.email,
          "password": event.password,
        });

        Map<String,dynamic> jsonResponse = jsonDecode(response.body);
        LoginDataModel loginDataModel = LoginDataModel.fromJson(jsonResponse);
        if (loginDataModel.statuscode != 200) {
          emit(LoginFailureState(message: "Oops! Something went wrong"));
          return;
        }

        else if(loginDataModel.statuscode == 200) {
          emit(LoginSuccessState(message : "Logged in sucessfully" ,token: loginDataModel.data!.accessToken , ));
        }

      } catch (e) {
        emit(LoginFailureState(message: "Oops! Something went wrong"));
      }
    });


    on<RegisterButtonPressed>((event, emit) {
       HelperFucntions.navigateTo(event.context, "/register");
      emit(RegisterButtonPressedState());
    });
  }
  
}