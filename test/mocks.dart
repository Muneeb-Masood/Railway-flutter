// test/mocks_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_railway_app/screens/login/login_model.dart';
import 'package:flutter_railway_app/screens/login/login_model_impl.dart';
import 'package:mockito/annotations.dart';


@GenerateMocks([
  LoginModel,
  LoginModelImpl,
  BuildContext,

])
void main() {}
