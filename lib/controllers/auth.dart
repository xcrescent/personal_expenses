import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthController {
  String capitalizeAllWord(String value) {
    var result = value[0].toUpperCase();
    for (int i = 1; i < value.length; i++) {
      if (value[i - 1] == " ") {
        result = result + value[i].toUpperCase();
      } else {
        result = result + value[i];
      }
    }
    return result;
  }

  Future<String> signUpUsingEmailPassword(email, pass, fname) async {
    final response = await http.post(
        Uri.parse(
            'https://auth-backend-production-054a.up.railway.app/api/v1/auth/signup'),
        body: json.encode({
          "name": capitalizeAllWord(fname),
          "email": email,
          "password": pass
        }));
    if (response.statusCode == 200) {
      return "success";
    } else {
      return "bad request";
    }
  }

  Future signUpVerifyOtp(int otp, String email) async {
    final response = await http.post(
        Uri.parse(
            'https://auth-backend-production-054a.up.railway.app/api/v1/auth/verify'),
        body: json.encode({"otp": otp, "email": email}));
    if (response.statusCode == 200) {
      return "success";
    } else {
      return "bad request";
    }
  }

  Future<String> sendOtp(email) async {
    final response = await http.post(
        Uri.parse(
            'https://auth-backend-production-054a.up.railway.app/api/v1/auth/send-otp'),
        body: json.encode({"email": email, "for_signup": false}));
    if (response.statusCode == 200) {
      return "success";
    } else {
      return "bad request";
    }
  }

  Future<String> reSendOtpignup(email) async {
    final response = await http.post(
        Uri.parse(
            'https://auth-backend-production-054a.up.railway.app/api/v1/auth/send-otp'),
        body: json.encode({"email": email, "for_signup": true}));
    if (response.statusCode == 200) {
      return "success";
    } else {
      return "bad request";
    }
  }

  Future<Map<String, dynamic>> signInUsingEmailPassword(email, pass) async {
    final response = await http.post(
        Uri.parse(
            'https://auth-backend-production-054a.up.railway.app/api/v1/auth/login'),
        body: json.encode({"email": email, "password": pass}));
    if (response.statusCode == 200) {
      AccessToken accessTokens = accessTokenFromJson(response.body);

      print(accessTokens.accessToken);
      print(accessTokens.refreshToken);

      return {
        'status': 'success',
        'accessToken': accessTokens.accessToken,
        'refreshToken': accessTokens.refreshToken,
      };
    } else {
      return {'status': 'bad request'};
    }
  }

  Future resetPasswordUsingOtp(otp, email, newPass) async {
    final response = await http.post(
      Uri.parse(
          'https://auth-backend-production-054a.up.railway.app/api/v1/auth/reset'),
      body: json.encode(
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
    final response = await http.get(
        Uri.parse('https://auth-backend-production-054a.up.railway.app/api/v1'),
        headers: ({'Authorization': 'Bearer $accessToken'}));
    if (response.statusCode == 200) {
      AuthData authData = authDataFromJson(response.body);
      final split = authData.message.split('Hello, ');
      split[0] = split[1].split('!')[0];
      return capitalizeAllWord(split[0]);
    } else {
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
//   AuthController().authChanges();
// }

// utkarsh2110024@akgec.ac.in
// "access_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJ1dGthcnNoMjExMDAyNEBha2dlYy5hYy5pbiIsInN1YiI6IkFDQ0VTUyIsImV4cCI6MTY3MDMzMjk4Mn0.pgnGG8hwDoBTiLPK9P1iVoGw1IP3CJ1_nUiBSS68OE4",
// "refresh_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJ1dGthcnNoMjExMDAyNEBha2dlYy5hYy5pbiIsInN1YiI6IlJFRlJFU0giLCJleHAiOjE2Njk3MzE3ODJ9.dLwmoRPWys_HerNZ4OuQ5nRlj9-fSj8jMsqLPJSISFg"