import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:personal_expenses/controllers/auth.dart';
import 'package:personal_expenses/screens/ui/home.dart';
import 'package:personal_expenses/utils/colors.dart';

class VerifyOtpActivity extends StatefulWidget {
  const VerifyOtpActivity({super.key, required this.email});
  final email;
  @override
  State<VerifyOtpActivity> createState() => _VerifyOtpActivityState();
}

class _VerifyOtpActivityState extends State<VerifyOtpActivity> {
  final _otpController = TextEditingController();
  bool _isLoading = false;
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
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                cursorColor: buttonColor,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
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
                  labelText: 'Enter OTP',
                  prefixIcon: Icon(
                    Icons.lock,
                    color: buttonColor,
                  ),
                ),
                controller: _otpController,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_otpController.text.length < 6) {
                    showSnackBarr('OTP is too short', context);
                    // _fnameController.clear();
                  } else {
                    verifOtp();
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
                        "Verify OTP",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  verifOtp() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthController().signUpVerifyOtp(
      int.parse(_otpController.text),
      widget.email,
    );

    if (res != 'success') {
      setState(() {
        _isLoading = false;
      });
      if (!mounted) return;
      return showSnackBarr(res, context);
    } else {
      if (!mounted) return;
      showSnackBarr('OTP verified successfully', context);
      return Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> HomeScreen()));
    }
  }
}

// void main() {
//   print(int.parse("603786"));
// }
