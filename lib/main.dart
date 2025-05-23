import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_railway_app/login_bloc/login_bloc.dart';
import 'package:flutter_railway_app/screens/home/home_screen.dart';
import 'package:flutter_railway_app/screens/login/login_screen.dart';
import 'package:flutter_railway_app/screens/register/register_screen.dart';
import 'package:flutter_railway_app/screens/walk_through_screen/walk_through_screen.dart';
void main() {
  runApp(
    BlocProvider(
      create: (_) => LoginBloc(),
      child: MaterialApp(
        routes: {
          '/register': (context) => RegisterScreen(),
          '/login': (context) => LoginScreen(),
          '/home': (context) => HomeScreen(),
          '/walkthrough': (context) => WalkThroughScreen(),
        },
        initialRoute: '/walkthrough',
      ),
    ),
  );
}
