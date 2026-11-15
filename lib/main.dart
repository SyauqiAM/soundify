
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const SoundifyApp());
}

class SoundifyApp extends StatelessWidget {
  const SoundifyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Soundify',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF101A1B),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
