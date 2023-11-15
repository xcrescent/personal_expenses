// new pass , login regex,
// default login on signup and pass change
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:personal_expenses/controllers/auth.dart';
import 'package:personal_expenses/controllers/db.dart';
import 'package:personal_expenses/screens/auth/signup_screen.dart';
import 'package:personal_expenses/screens/ui/home.dart';
import 'package:personal_expenses/utils/colors.dart';

class LoginActivity extends StatefulWidget {
  const LoginActivity({super.key});

  @override
  State<LoginActivity> createState() => _LoginActivity();
}

class _LoginActivity extends State<LoginActivity>
    with SingleTickerProviderStateMixin {
  bool _isLoading = false;
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  late DataBaseCon handler;
  bool activeConnection = false;
  String T = "";
  Future checkUserConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        setState(() {
          activeConnection = true;
          // T = "Turn off the data and repress again";
        });
      }
    } on SocketException catch (_) {
      setState(() {
        activeConnection = false;
        T = "Turn On the data and repress again";
      });
    }
  }

  loginUsers() async {
    setState(() {
      _isLoading = true;
    });
    Map res = await AuthController()
        .signInUsingEmailPassword(_emailController.text, _passController.text);
    String name = await AuthController().authChanges(res['accessToken']);
    if (res['status'] != 'success') {
      setState(() {
        _isLoading = false;
      });
      if (!mounted) return;
      return showSnackBarr(res['status'], context);
    } else {
      if (!mounted) return;
      showSnackBarr(
          'Congratulations you have been successfully signed in..', context);
      return Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomeScreen(
            name: name,
            res: res,
          ),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _emailController.text = "utkarshsinghjadon196@gmail.com";
    _passController.text = "Utkarsh@123";
    if (kIsWeb) {
      setState(() {
        activeConnection = true;
      });
    } else {
      checkUserConnection();
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Center(child:Text("Login")),),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 150),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 60,
              ),

              TextFormField(
                cursorColor: buttonColor,
                decoration: const InputDecoration(
                  filled: true,
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: buttonColor),
                  ),
                  labelText: 'Enter email address',
                  labelStyle: TextStyle(
                    color: buttonColor,
                    fontFamily: 'Poppins',
                  ),
                  prefixIcon: Icon(
                    Icons.email,
                    color: buttonColor,
                  ),
                ),
                controller: _emailController,
              ),
              const SizedBox(
                height: 25,
              ),

              TextFormField(
                obscureText: true,
                cursorColor: buttonColor,
                decoration: const InputDecoration(
                  filled: true,
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: buttonColor),
                  ),
                  labelText: 'Enter password',
                  labelStyle: TextStyle(
                    color: buttonColor,
                    fontFamily: 'Poppins',
                  ),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: buttonColor,
                  ),
                ),
                controller: _passController,
              ),
              // ),
              const SizedBox(
                height: 35,
              ),
              ElevatedButton(
                onPressed: () {
                  loginUsers();
                },
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    backgroundColor: buttonColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                      30,
                    ))),
                child: _isLoading
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )
                    : const Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Poppins',
                        ),
                      ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/forgotPass');
                },
                child: const Text(
                  "Forgot Password?",
                  style: TextStyle(
                    fontSize: 19,
                    color: buttonColor,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Don't have an account?",
                    style: TextStyle(
                      fontSize: 19,
                      color: buttonColor.withOpacity(0.8),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (context) => const SignUpActivity())),
                    style: ElevatedButton.styleFrom(
                        // minimumSize: const Size(double.infinity, 50),
                        backgroundColor: buttonColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                          30,
                        ))),
                    child: const Text(
                      "Sign up",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),

                  // InkWell(
                  //   onTap: () {
                  //     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const SignUpActivity()));
                  //   },
                  //   child: Container(
                  //     decoration: const BoxDecoration(
                  //         borderRadius:
                  //             BorderRadius.all(Radius.circular(20))),
                  //     child: const Text(
                  //       "Sign up",
                  //       style: TextStyle(
                  //           fontSize: 22,
                  //           fontFamily: 'Poppins',
                  //           color: buttonColor,
                  //           fontWeight: FontWeight.w600),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

showSnackBarr(String content, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(content)));
}
