import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:personal_expenses/screens/auth/signup_screen.dart';
import 'package:personal_expenses/screens/auth/verify_otp.dart';
import 'package:personal_expenses/screens/ui/home.dart';

class MaterialStoreApp extends StatelessWidget {
  const MaterialStoreApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // This app is designed only to work vertically, so we limit
    // orientations to portrait up and down.
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return MaterialApp(
      // theme: Theme(brightness: Brightness.light),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white.withOpacity(0.95),
      ),
      routes: {
        '/': (context) => const HomeScreen(),
        '/signup': (context) => const SignUpActivity(),
        '/verifyOtp': (context) => const VerifyOtpActivity(),
      },
    );
  }
}

// class MaterialStoreHomePage extends StatelessWidget {
//   const MaterialStoreHomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Personal Expenses'),
//       ),
//       body: const SizedBox(),
//     );
//   }
// }
