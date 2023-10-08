import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:personal_expenses/app.dart';
import 'package:personal_expenses/web.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return const MaterialStoreWeb();
    }
    return const MaterialStoreApp();
  }
}
