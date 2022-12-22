import 'package:flutter/material.dart';
import 'package:personal_expenses/controllers/auth.dart';
import 'package:personal_expenses/utils/colors.dart';

class ResetPassActivity extends StatefulWidget {
  const ResetPassActivity({super.key, required this.email});
  final String email;
  @override
  State<ResetPassActivity> createState() => _ResetPassActivity();
}

class _ResetPassActivity extends State<ResetPassActivity> {
  bool _isLoading = false;
  final _otpController = TextEditingController();
  final _passController = TextEditingController();
  resetPass() async {
    setState(() {
      _isLoading = true;
    });
    String res =
        await AuthController().resetPasswordUsingOtp(int.parse(_otpController.text), widget.email, _passController.text);
    if (res != 'success') {
      setState(() {
        _isLoading = false;
      });
      if (!mounted) return;
      return showSnackBarr(res, context);
    } else {
      if (!mounted) return;
      showSnackBarr('Password has been successfully changed', context);
      return Navigator.of(context).pushReplacementNamed('/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(
                height: 130,
              ),
              const Text(
                "Forgot Password",
                style: TextStyle(fontSize: 28, color: Colors.black),
              ),
              const SizedBox(
                height: 50,
              ),
              TextFormField(
                cursorColor: buttonColor,
                decoration: const InputDecoration(
                    filled: true,
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: buttonColor),
                    ),
                    labelText: 'Enter OTP',
                    labelStyle: TextStyle(
                      color: buttonColor,
                    )),
                controller: _otpController,
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                cursorColor: buttonColor,
                decoration: const InputDecoration(
                    filled: true,
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: buttonColor),
                    ),
                    labelText: 'Enter New Pass',
                    labelStyle: TextStyle(
                      color: buttonColor,
                    )),
                controller: _passController,
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  resetPass();
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
                    : const Text("Reset Password",
                        style: TextStyle(fontSize: 17)),
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
