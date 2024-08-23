import 'package:flutter/material.dart';
import 'package:login_assignment/application_ui/application_ui.dart';

import 'application_screens/screens/home_screen.dart';
import 'application_screens/screens/signUp_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: ApplicationUi.primaryColor),
        useMaterial3: true,
      ),
      home: const SignUpPage(),
    );
  }
}
