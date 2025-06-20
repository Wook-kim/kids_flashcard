import 'package:flutter/material.dart';
import 'screens/flashcard_screen.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'ComicSans',
      ),
      home: const FlashcardScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
