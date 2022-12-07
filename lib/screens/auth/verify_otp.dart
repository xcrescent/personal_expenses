import 'package:flutter/material.dart';
import 'package:personal_expenses/utils/colors.dart';

class VerifyOtpActivity extends StatefulWidget {
  const VerifyOtpActivity({super.key});

  @override
  State<VerifyOtpActivity> createState() => _VerifyOtpActivityState();
}

class _VerifyOtpActivityState extends State<VerifyOtpActivity> {
  final _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                  labelText: 'Enter OTP',
                  prefixIcon: Icon(
                    Icons.lock,
                    color: buttonColor,
                  ),
                ),
                controller: _otpController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
