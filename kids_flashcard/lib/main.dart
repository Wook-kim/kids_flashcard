import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const KidsFlashcardApp());
}

class KidsFlashcardApp extends StatelessWidget {
  const KidsFlashcardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kids Flashcards',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
