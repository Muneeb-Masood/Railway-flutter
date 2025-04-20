class LoginDataModel {
  final int statuscode;
  final Data? data;
  final String message;
  final bool success;

  LoginDataModel({
    required this.statuscode,
    required this.data,
    required this.message,
    required this.success,
  });

  factory LoginDataModel.fromJson(Map<String, dynamic> json) {
    return LoginDataModel(
      statuscode: json['statuscode'],
      data: json['data'].isNotEmpty ? Data.fromJson(json['data']) : null,
      message: json['message'],
      success: json['success'],
    );
  }
}

class Data {
  final User user;
  final String accessToken;
  final String refreshToken;

  Data({
    required this.user,
    required this.accessToken,
    required this.refreshToken,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      user: User.fromJson(json['user']),
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
    );
  }
}

class User {
  final String passengerId;
  final String name;
  final String email;
  final String phone;
  final String cnic;
  final String gender;
  final String dob;
  final String address;
  final String profilePhoto;
  final String createdAt;
  final String password;
  final String refreshtoken;
  final dynamic otp;
  final dynamic otpExpiresAt;
  final dynamic role;

  User({
    required this.passengerId,
    required this.name,
    required this.email,
    required this.phone,
    required this.cnic,
    required this.gender,
    required this.dob,
    required this.address,
    required this.profilePhoto,
    required this.createdAt,
    required this.password,
    required this.refreshtoken,
    this.otp,
    this.otpExpiresAt,
    this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      passengerId: json['passenger_id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      cnic: json['cnic'],
      gender: json['gender'],
      dob: json['dob'],
      address: json['address'],
      profilePhoto: json['profile_photo'],
      createdAt: json['created_at'],
      password: json['password'],
      refreshtoken: json['refreshtoken'],
      otp: json['otp'],
      otpExpiresAt: json['otp_expires_at'],
      role: json['role'],
    );
  }
}
