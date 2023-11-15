import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:personal_expenses/controllers/auth.dart';
import 'package:personal_expenses/screens/auth/login_screen.dart';
import 'package:personal_expenses/screens/auth/verify_otp.dart';
import 'package:personal_expenses/utils/colors.dart';

class SignUpActivity extends StatefulWidget {
  const SignUpActivity({super.key});

  @override
  State<SignUpActivity> createState() => _SignUpActivity();
}

class _SignUpActivity extends State<SignUpActivity>
    with SingleTickerProviderStateMixin {
  bool _isLoading = false;
  final _emailController = TextEditingController();
  final _fnameController = TextEditingController();
  final _passController = TextEditingController();
  final _cpassController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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

  @override
  void initState() {
    super.initState();
    // _emailController.text = "utkarshsinghjadon196@gmail.com";
    // _passController.text = "Utkarsh@123";
    // _fnameController.text = "Utkarsh";
    // _cpassController.text = "Utkarsh@123";
    if (!kIsWeb) {
      checkUserConnection();
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }

  signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    Response<dynamic> res = await AuthController().signUpUsingEmailPassword(
      _emailController.text,
      _passController.text,
      _fnameController.text,
    );

    if (res.statusCode != 201) {
      setState(() {
        _isLoading = false;
      });

      if (!mounted) return;
      if (res.statusCode == 401) {
        showSnackBarr(res.data, context);
        return Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => VerifyOtpActivity(
                  email: _emailController.text,
                  name: _fnameController.text,
                )));
      } else {
        return showSnackBarr(res.data, context);
      }
    } else {
      if (!mounted) return;
      showSnackBarr('Enter the OTP sent to your email address', context);
      return Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => VerifyOtpActivity(
                email: _emailController.text,
                name: _fnameController.text,
              )));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: const Center(
        //     child: Text("Sign Up"),
        //   ),
        //   elevation: 0,
        // ),
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(children: [
          Text(T),
          const Divider(),
          Container(
            height: MediaQuery.of(context).size.height - 200,
            padding: const EdgeInsets.all(15),
            alignment: Alignment.center,
            child: Form(
              key: _formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    // const SizedBox(
                    //   height: 50,
                    // ),
                    // Stack(
                    //   children: <Widget>[
                    //     _image != null
                    //         ? CircleAvatar(
                    //             radius: 64,
                    //             backgroundColor: Colors.black,
                    //             backgroundImage: MemoryImage(_image!))
                    //         : const CircleAvatar(
                    //             radius: 64,
                    //             backgroundColor: Colors.black,
                    //             backgroundImage: AssetImage('assets/images/OIP.jpg'),
                    //             // NetworkImage(
                    //             //   'https://picsum.photos/250?image=9',
                    //             // ),
                    //             // NetworkImage('file://assets/images/google.png',),
                    //           ),
                    //     Positioned(
                    //       right: 5,
                    //       bottom: 10,
                    //       child: InkWell(
                    //         onTap: selectImage,
                    //         child: const Icon(Icons.add_a_photo),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      cursorColor: buttonColor,
                      decoration: const InputDecoration(
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: buttonColor,
                            ),
                          ),
                          labelStyle: TextStyle(
                              color: buttonColor, fontFamily: 'Poppins'),
                          labelText: 'Enter full name',
                          hintStyle: TextStyle(
                            color: Color.fromARGB(181, 48, 63, 159),
                            fontFamily: 'Poppins',
                          ),
                          hintText: 'Full Name',
                          prefixIcon: Icon(
                            Icons.person,
                            color: buttonColor,
                          )),
                      validator: ((value) {
                        if (value!.isEmpty) {
                          return "First Name is empty";
                        }
                        return null;
                      }),
                      controller: _fnameController,
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      cursorColor: buttonColor,
                      decoration: const InputDecoration(
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: buttonColor,
                          ),
                        ),
                        labelStyle: TextStyle(
                            color: buttonColor, fontFamily: 'Poppins'),
                        labelText: 'Enter email address',
                        hintText: 'Email Address',
                        hintStyle: TextStyle(
                          color: Color.fromARGB(181, 48, 63, 159),
                          fontFamily: 'Poppins',
                        ),
                        prefixIcon: Icon(
                          Icons.email,
                          color: buttonColor,
                        ),
                      ),
                      controller: _emailController,
                      validator: ((value) {
                        if (!(RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value!))) {
                          return "Invalid email address";
                        }
                        return null;
                      }),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      cursorColor: buttonColor,
                      obscureText: true,
                      decoration: const InputDecoration(
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: buttonColor,
                          ),
                        ),
                        labelStyle: TextStyle(
                            color: buttonColor, fontFamily: 'Poppins'),
                        labelText: 'Enter password',
                        hintText: 'Password',
                        hintStyle: TextStyle(
                          color: Color.fromARGB(181, 48, 63, 159),
                          fontFamily: 'Poppins',
                        ),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: buttonColor,
                        ),
                      ),
                      controller: _passController,
                      validator: (value) {
                        if (!(RegExp(
                                r"^(?=.*[0-9])(?=.*[A-Z])(?=.*[a-z])(?=.*[@#$%^&-+=()]).{8,20}$")
                            .hasMatch(value!))) {
                          return "Must have at least one lowercase, one uppercase , \none number, one special character and length at least 8";
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // Padding(
                    //   padding:
                    //       const EdgeInsets.symmetric(horizontal: 88, vertical: 16),
                    // child:
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      cursorColor: buttonColor,
                      obscureText: true,
                      decoration: const InputDecoration(
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: buttonColor,
                          )),
                          labelStyle: TextStyle(
                              color: buttonColor, fontFamily: 'Poppins'),
                          labelText: 'Re-enter Password',
                          hintText: 'Confirm Password',
                          hintStyle: TextStyle(
                            color: Color.fromARGB(181, 48, 63, 159),
                            fontFamily: 'Poppins',
                          ),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: buttonColor,
                          )),
                      controller: _cpassController,
                      validator: (value) {
                        if (value != _passController.text) {
                          return "Password not matched";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    // ),
                    // Container(
                    //   width: MediaQuery.of(context).size.width -40,
                    //   height: 50,
                    //   child: const Center(
                    //     child: Text(
                    //     'Register',
                    //     style: TextStyle(
                    //     fontWeight: FontWeight.bold,
                    //     fontSize: 24,
                    //     ),),),
                    // ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          signUpUser();
                          // _fnameController.clear();
                        } else {
                          showSnackBarr('Please check your details', context);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        backgroundColor: buttonColor,
                      ),
                      child: _isLoading
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          : const Text(
                              "Signup",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
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
                          "Already have an Account?",
                          style: TextStyle(
                            fontSize: 18,
                            color: buttonColor.withOpacity(0.8),
                            fontFamily: 'Poppins',
                            // fontWeight: FontWeight.bold
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                          onPressed: () => Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                                  builder: (context) => const LoginActivity())),
                          style: ElevatedButton.styleFrom(
                              // minimumSize: const Size(double.infinity, 50),
                              backgroundColor: buttonColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                30,
                              ))),
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),

                        // InkWell(
                        //   onTap: () {
                        //     Navigator.of(context)
                        //         .pushReplacementNamed('/login');
                        //   },
                        //   child: const Text(
                        //     "Login",
                        //     style: TextStyle(
                        //       fontSize: 22,
                        //       color: buttonColor,
                        //       fontFamily: 'Poppins',
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                    // const SizedBox(
                    //   height: 30,
                    // ),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     Navigator.of(context).pushReplacement(
                    //       MaterialPageRoute(
                    //           builder: (context) => const HomeScreen(name: "Waseem Akram", res: {},)),
                    //     );
                    //   },
                    //   style: ElevatedButton.styleFrom(
                    //     minimumSize: const Size(double.infinity, 50),
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(30),
                    //     ),
                    //     backgroundColor: buttonColor,
                    //   ),
                    //   child: _isLoading
                    //       ? const Center(
                    //           child: CircularProgressIndicator(
                    //             color: Colors.white,
                    //           ),
                    //         )
                    //       : const Text(
                    //           "Skip Now",
                    //           style: TextStyle(
                    //             fontWeight: FontWeight.bold,
                    //             fontSize: 18,
                    //             fontFamily: 'Poppins',
                    //           ),
                    //         ),
                    // ),
                  ]),
            ),
          ),
        ]),
      ),
    ));
  }
}

showSnackBarr(String content, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(content)));
}
