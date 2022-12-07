import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:personal_expenses/controllers/auth.dart';
import 'package:personal_expenses/utils/colors.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// class Credentials {
//   final String email;
//   final String password;

//   const Credentials(this.email, this.password);
// }

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
    checkUserConnection();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }

  // Uint8List? _image;
  // selectImage() async {
  //   // Uint8List im = await AuthController().pickImage(ImageSource.gallery);
  //   setState(() {
  //     // _image = im;
  //   });
  // }

  signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthController().signUpUsingEmailPassword(
      _emailController.text,
      _passController.text,
      _fnameController.text,
    );

    if (res != 'success') {
      setState(() {
        _isLoading = false;
      });
      if (!mounted) return;
      return showSnackBarr(res, context);
    } else {
      if (!mounted) return;
      showSnackBarr('Enter the OTP sent to your email address', context);
      return Navigator.of(context).pushReplacementNamed('/verifyOtp');
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
        body: SingleChildScrollView(
      child: Column(children: [
        Text(T),
        const Divider(),
        Container(
          padding: const EdgeInsets.all(15),
          alignment: Alignment.center,
          child: Form(
            key: _formKey,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
                        labelStyle: TextStyle(color: buttonColor),
                        labelText: 'Enter full name',
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
                      labelStyle: TextStyle(color: buttonColor),
                      labelText: 'Enter email address',
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
                      labelStyle: TextStyle(color: buttonColor),
                      labelText: 'Enter password',
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
                        labelStyle: TextStyle(color: buttonColor),
                        labelText: 'Re-enter Password',
                        hintText: 'Confirm Password',
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
                        // showSnackBarr('Please check your details', context);
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
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          "Already have an Account?",
                          style: TextStyle(
                            fontSize: 18,
                            // fontWeight: FontWeight.bold
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .pushReplacementNamed('/login');
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(fontSize: 22, color: Colors.black),
                          ),
                        ),
                      ]),
                ]),
          ),
        ),
      ]),
    ));
  }
}
