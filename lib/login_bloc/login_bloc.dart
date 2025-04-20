import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_railway_app/login_bloc/login_event.dart';
import 'package:flutter_railway_app/login_bloc/login_state.dart';
import 'package:flutter_railway_app/models/login_data_model.dart';
import 'package:http/http.dart' as http;

class LoginBloc extends Bloc<LoginEvent, LoginState>{
  LoginBloc() : super(LoginInitial()){
    on<LoginButtonPressed>((event, emit) async {
      emit(LoginLoading());
      try {
        if(event.email.isEmpty || event.password.isEmpty) {
          emit(LoginFailure(error: "Email and password cannot be empty"));
          return;
        }

        Uri uri = Uri.parse("http://192.168.100.111:5000/api/passengers/login");
        final response = await http.post(uri, body: {
          "email": event.email,
          "password": event.password,
        });

        Map<String,dynamic> jsonResponse = jsonDecode(response.body);
        LoginDataModel loginDataModel = LoginDataModel.fromJson(jsonResponse);
        if (loginDataModel.statuscode != 200) {
          emit(LoginFailure(error: loginDataModel.message));
          return;
        }

        else if(loginDataModel.statuscode == 200) {
          emit(LoginSuccess(token: loginDataModel.data!.accessToken));
        }
      } catch (e) {
        emit(LoginFailure(error: e.toString()));
      }
    });
  }
  
}