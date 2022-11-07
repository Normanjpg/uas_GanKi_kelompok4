import 'package:flutter/material.dart';
import 'package:uas_1/Screens/HAwal.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:uas_1/Screens/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      home: AuthService().handleAuthState(),
    );
  }
}
