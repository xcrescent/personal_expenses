import 'dart:io';

import 'package:flutter/material.dart';
import 'package:personal_expenses/controllers/auth.dart';
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
    String res = await AuthController()
        .signInUsingEmailPassword(_emailController.text, _passController.text);
    if (res != 'success') {
      setState(() {
        _isLoading = false;
      });
      if (!mounted) return;
      return showSnackBarr(res, context);
    } else {
      if (!mounted) return;
      showSnackBarr(
          'Congratulations you have been successfully signed in..', context);
      return Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomeScreen()));
    }
  }

  @override
  void initState() {
    super.initState();
    checkUserConnection();
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
                height: 25,
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
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "New User?",
                      style: TextStyle(
                        fontSize: 19,
                        color: buttonColor.withOpacity(0.8),
                        fontFamily: 'Poppins',
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushReplacementNamed('/');
                      },
                      child: Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20))),
                        child: const Text(
                          "SIGN UP",
                          style: TextStyle(
                              fontSize: 23,
                              fontFamily: 'Poppins',
                              color: buttonColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ]),
            ],
          ),
        ),
      ),
    );
  }
}
