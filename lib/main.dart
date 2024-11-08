import 'package:flutter/material.dart';
import 'package:onboarding_screen/loadingScreen.dart';
import 'package:onboarding_screen/onboarding_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoadingS(),
    );
  }
}
