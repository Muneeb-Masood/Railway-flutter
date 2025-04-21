// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_railway_app/login_bloc/login_bloc.dart';
// import 'package:flutter_railway_app/login_bloc/login_event.dart';
// import 'login_model.dart';

// class LoginModelImpl {
//   final LoginModel model = LoginModel.instance;
//   void onPressed(BuildContext context) {
//     final email = model.emailController.text.trim();
//     final password = model.passwordController.text.trim();

//     // Dispatch the event
//     context.read<LoginBloc>().add(
//       LoginButtonPressed(email: email, password: password),
//     );
//   }
// }


import 'package:flutter_railway_app/screens/login/login_model_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../mocks.mocks.dart';

void main(){

  LoginModelImpl loginModelImpl = LoginModelImpl();
  late MockBuildContext mockBuildContext;
  late MockLoginModelImpl mockLoginModelImpl;

  setUp(() {
    mockBuildContext = MockBuildContext();
    mockLoginModelImpl = MockLoginModelImpl();
  });


  test("testing login button pressed", (){
    loginModelImpl.onPressed(mockBuildContext);

    verify(loginModelImpl.model.emailController.text.trim()).called(1);
    verify(loginModelImpl.model.passwordController.text.trim()).called(1);
    verify(loginModelImpl.onPressed(mockBuildContext)).called(1);
      });
  
}