import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class AuthController {
  final dio =
      Dio(BaseOptions(baseUrl: "https://aeronex-auth-prod.onrender.com"));
  String capitalizeAllWord(String value) {
    try {
      var result = value[0].toUpperCase();
      for (int i = 1; i < value.length; i++) {
        if (value[i - 1] == " ") {
          result = result + value[i].toUpperCase();
        } else {
          result = result + value[i];
        }
      }
      return result;
    } catch (e) {
      print(e);
      return value;
    }
  }

  Future<Response> signUpUsingEmailPassword(email, pass, fname) async {
    try {
      final response = await dio.post('/api/v1/auth/register', data: {
        "name": capitalizeAllWord(fname),
        "email": email,
        "password": pass
      });
      if (kDebugMode) {
        print(response.data);
        print(response.statusCode);
      }
      if (response.statusCode == 201) {
        return response;
      } else {
        return response;
      }
    } on DioError catch (e) {
      return e.response!;
    }
  }

  Future<Map<String, dynamic>> signUpVerifyOtp(int otp, String email) async {
    try {
      final response = await dio
          .post('/api/v1/auth/verify', data: {"otp": otp, "email": email});
      if (response.statusCode == 200) {
        print("Response ${response.data['message']}");

        return {
          'status': 'success',
          'message': response.data['message'],
          'accessToken': response.data['accessToken'],
          'refreshToken': response.data['refreshToken'],
        };
      } else {
        return {'status': 'bad request'};
      }
    } catch (e) {
      print(e);
      return {'status': 'bad request'};
    }
  }

  Future<String> sendOtp(email) async {
    try {
      final response = await dio.post('/api/v1/auth/send-otp',
          data: {"email": email, "for_signup": false});
      if (response.statusCode == 201) {
        return "success";
      } else {
        return "bad request";
      }
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e.response!.data);
      }
      return e.response!.data;
    }
  }

  Future<String> reSendOtpSignup(email) async {
    // final response = await http.post(
    //     Uri.parse(
    //         '/api/v1/auth/send-otp'),
    //     body: json.encode({"email": email, "for_signup": true}));
    final response = await dio.post('/api/v1/auth/send-otp',
        data: {"email": email, "for_signup": true});
    if (response.statusCode == 201) {
      return "success";
    } else {
      return "bad request";
    }
  }

  Future<Map<String, dynamic>> signInUsingEmailPassword(email, pass) async {
    // final response = await http.post(
    //     Uri.parse(
    //         '/api/v1/auth/login'),
    //     body: json.encode({"email": email, "password": pass}));
    final response = await dio
        .post('/api/v1/auth/login', data: {"email": email, "password": pass});
    if (response.statusCode == 200) {
      return {
        'status': 'success',
        'accessToken': response.data['accessToken'],
        'refreshToken': response.data['refreshToken'],
      };
    } else {
      return {'status': 'bad request'};
    }
  }

  Future resetPasswordUsingOtp(otp, email, newPass) async {
    final response = await dio.post(
      '/api/v1/auth/reset',
      data: json.encode(
        {"otp": otp, "email": email, "new_password": newPass},
      ),
    );
    if (response.statusCode == 200) {
      return "success";
    } else {
      return "bad request";
    }
  }

  Future<String> authChanges(String accessToken) async {
    try {
      final response = await Dio(
          BaseOptions(headers: {'Authorization': 'Bearer $accessToken'})).get(
        'https://aeronex-auth-prod.onrender.com/api/v1',
      );

      // headers: ({'Authorization': 'Bearer $accessToken'}));
      if (response.statusCode == 200) {
        print("Message : ${response.data['message'].split('Hello, ')[1]}");
        return response.data['message'].split('Hello, ')[1];
        // return capitalizeAllWord(response.data['message'].split('Hello, ')[0]);
        // final split = authData.message.split('Hello, ');
        // split[0] = split[1].split('!')[0];
        // return capitalizeAllWord(split[0]);
      } else {
        return "Null";
      }
    } catch (e) {
      print(e);
      return "Null";
    }
  }
}

AccessToken accessTokenFromJson(String str) =>
    AccessToken.fromJson(json.decode(str));

String welcomeToJson(AccessToken data) => json.encode(data.toJson());

AuthData authDataFromJson(String str) => AuthData.fromJson(json.decode(str));

String authDataToJson(AuthData data) => json.encode(data.toJson());

class AuthData {
  AuthData({
    required this.message,
  });

  String message;

  factory AuthData.fromJson(Map<String, dynamic> json) => AuthData(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}

class AccessToken {
  AccessToken({
    required this.accessToken,
    required this.refreshToken,
  });

  String accessToken;
  String refreshToken;

  factory AccessToken.fromJson(Map<String, dynamic> json) => AccessToken(
        accessToken: json["access_token"],
        refreshToken: json["refresh_token"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "refresh_token": refreshToken,
      };
}

// void main() {
//   // AuthController().signInUsingOtp();
//   AuthController().sendOtp('whataboutadate@gmail.com');
// }

// utkarsh2110024@akgec.ac.in
// "access_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJ1dGthcnNoMjExMDAyNEBha2dlYy5hYy5pbiIsInN1YiI6IkFDQ0VTUyIsImV4cCI6MTY3MDMzMjk4Mn0.pgnGG8hwDoBTiLPK9P1iVoGw1IP3CJ1_nUiBSS68OE4",
// "refresh_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJ1dGthcnNoMjExMDAyNEBha2dlYy5hYy5pbiIsInN1YiI6IlJFRlJFU0giLCJleHAiOjE2Njk3MzE3ODJ9.dLwmoRPWys_HerNZ4OuQ5nRlj9-fSj8jMsqLPJSISFg"
