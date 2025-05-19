import 'package:flutter_railway_app/helper_funtions/helper_functions.dart';
import 'package:flutter_railway_app/screens/register/register_model.dart';

class RegisterModelImpl {

  RegisterModel model;
  RegisterModelImpl(this.model);

  Future<void> onPressed(String email, String password, String confirmPassword) async {
  if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
    print("Please fill in all fields.");
    return;
  } else if (password != confirmPassword) {
    print("Passwords do not match.");
    return;
  }

  try {
    final response = await HelperFucntions.postApi(
      "http://192.168.56.1:5000/api/passengers/register",
      body: {
        "email": email,
        "password": password,
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Registration successful");
    } else {
      print("Failed to register: ${response.body}");
    }
  } catch (e) {
    print("Error: $e");
  }
}

}