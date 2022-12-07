import 'dart:io';

import 'package:flutter/material.dart';
import 'package:personal_expenses/controllers/auth.dart';
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
    String res = await AuthController().signInUsingEmailPassword(
        _emailController.text, _passController.text);
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
      return Navigator.of(context).pushReplacementNamed('/home');
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
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  labelText: 'Enter email address',
                  labelStyle: TextStyle(color: buttonColor),
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
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  labelText: 'Enter password',
                  labelStyle: TextStyle(color: buttonColor),
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
                    backgroundColor: Colors.black,
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
                    : const Text("Login", style: TextStyle(fontSize: 16)),
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
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      "New User?",
                      style: TextStyle(
                        fontSize: 19,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushReplacementNamed('/signup');
                      },
                      child: const Text(
                        "SIGN UP",
                        style: TextStyle(
                            fontSize: 23,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ]),
              const SizedBox(
                height: 40,
              ),
              FloatingActionButton(
                onPressed: () async {
                  
                },
                backgroundColor: Colors.transparent,

                child: Image.asset('assets/images/google.png'),
                // shape:
              ),
              const SizedBox(
                height: 100,
              ),
              Text(T),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  } 
}
