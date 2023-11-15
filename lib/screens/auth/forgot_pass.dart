import 'package:flutter/material.dart';
import 'package:personal_expenses/controllers/auth.dart';
import 'package:personal_expenses/screens/auth/reset_pass.dart';
import 'package:personal_expenses/utils/colors.dart';

class ForgotPassActivity extends StatefulWidget {
  const ForgotPassActivity({super.key});

  @override
  State<ForgotPassActivity> createState() => _ForgotPassActivity();
}

class _ForgotPassActivity extends State<ForgotPassActivity> {
  bool _isLoading = false;
  final _emailController = TextEditingController();

  @override
  initState() {
    _emailController.text = 'utkarshsinghjadon196@gmail.com';
    super.initState();
  }

  sendOtp() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthController().sendOtp(_emailController.text);
    if (res != 'success') {
      setState(() {
        _isLoading = false;
      });
      if (!mounted) return;
      return showSnackBarr(res, context);
    } else {
      if (!mounted) return;
      showSnackBarr('Verify the otp sent to this email address', context);
      return Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => ResetPassActivity(email: _emailController.text),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: buttonColor,
      ),
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
                    labelText: 'Enter Email',
                    labelStyle: TextStyle(
                      color: buttonColor,
                    )),
                controller: _emailController,
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  sendOtp();
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
                        "Reset Password",
                        style: TextStyle(fontSize: 17),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
