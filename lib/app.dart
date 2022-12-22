import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:personal_expenses/controllers/auth.dart';
import 'package:personal_expenses/controllers/db.dart';
import 'package:personal_expenses/screens/auth/forgot_pass.dart';
import 'package:personal_expenses/screens/auth/login_screen.dart';
import 'package:personal_expenses/screens/auth/signup_screen.dart';
import 'package:personal_expenses/controllers/model.dart';
import 'package:personal_expenses/screens/ui/home.dart';

class MaterialStoreApp extends StatelessWidget {
  const MaterialStoreApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DataBaseCon handler = DataBaseCon();
    // This app is designed only to work vertically, so we limit
    // orientations to portrait up and down.
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    return MaterialApp(
      // theme: Theme(brightness: Brightness.light),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white.withOpacity(0.95),
      ),
      routes: {
        '/login': (context) => const LoginActivity(),
        '/forgotPass': (context) => const ForgotPassActivity(),
      },
      home: FutureBuilder(
        future: handler.retrieveUser(),
        builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.isNotEmpty) {
              return FutureBuilder(
                  future: AuthController()
                      .authChanges(snapshot.data![0].accessToken),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.hasData) {
                      // SchedulerBinding.instance.addPostFrameCallback((_) {
                      if (snapshot.data != "Null") {
                        return HomeScreen(name: snapshot.data!, res: {});
                      }
                    }
                    return const SignUpActivity();
                  });
            } else {
              return SignUpActivity();
            }
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
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
