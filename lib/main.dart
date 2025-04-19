import 'package:flutter/material.dart';
import 'package:flutter_railway_app/screens/login/login_screen.dart';
import 'package:flutter_railway_app/screens/register/register_screen.dart';
import 'package:flutter_railway_app/screens/splash_screen.dart';
import 'package:flutter_railway_app/screens/walk_through_screen/walk_through_screen.dart';
import 'package:flutter_railway_app/templates/walk_through_screen_template.dart';

void main(){
  runApp(
    MaterialApp(
      home: RegisterScreen(),
    )
  );
}