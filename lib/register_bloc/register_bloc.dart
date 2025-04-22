import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_railway_app/helper_functions/http_helper.dart';
import 'package:flutter_railway_app/register_bloc/register_event.dart';
import 'package:flutter_railway_app/register_bloc/register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent,RegisterState>{

  HttpHelper httpHelper = HttpHelper.instance;

  RegisterBloc() : super(RegisterInitialState()){
    on<RegiterButttonClicked>((event, emit) async {
      emit(RegisterLoadingState());
      try {
        httpHelper.post(httpHelper.getRegisterUrl,body: {
          "email" : event.email,
          "password" : event.password,
          "confirmPassword" : event.cPassword,
        },).then((response) {
          if (response.statusCode == 200) {
            emit(RegisterSuccessState("Registration successful"));
          } else {
            print("From line 24 of register_bloc" + response.statusCode.toString());
            emit(RegisterFailureState("Registration failed"));
          }
        }).catchError((error) {
          print("From line 28 of register_bloc");
          emit(RegisterFailureState(error.toString()));
        });
      } catch (e) {
        print("From line 32 of register_bloc");
        emit(RegisterFailureState(e.toString()));
      }
    });
  }
}