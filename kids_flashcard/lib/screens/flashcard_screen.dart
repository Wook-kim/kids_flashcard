import 'package:flutter/material.dart';
import '../widgets/flashcard_widget.dart';
import '../widgets/flashcard_theme.dart';
import '../models/flashcard_data.dart';

class FlashcardScreen extends StatefulWidget {
  const FlashcardScreen({Key? key}) : super(key: key);

  @override
  State<FlashcardScreen> createState() => _FlashcardScreenState();
}

class _FlashcardScreenState extends State<FlashcardScreen> {
  final PageController _pageController = PageController(viewportFraction: 0.8);
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      int next = _pageController.page!.round();
      if (_currentIndex != next) {
        setState(() {
          _currentIndex = next;
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF667EEA), Color(0xFF764BA2)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 40),
              const Text(
                '🌈 Kids Flashcard 🌈',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      offset: Offset(2, 2),
                      blurRadius: 4,
                      color: Colors.black26,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                '${_currentIndex + 1} / ${sampleFlashcards.length}',
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 40),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: sampleFlashcards.length,
                  itemBuilder: (context, index) {
                    final flashcard = sampleFlashcards[index];
                    final frontGradient = FlashcardTheme.frontGradients[
                        index % FlashcardTheme.frontGradients.length];
                    final backGradient = FlashcardTheme.backGradients[
                        index % FlashcardTheme.backGradients.length];

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Center(
                        child: FlashcardWidget(
                          frontEmoji: flashcard.emoji,
                          frontText: flashcard.englishWord,
                          backText: flashcard.koreanWord,
                          backDescription: flashcard.description,
                          frontGradient: frontGradient,
                          backGradient: backGradient,
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            heroTag: 'prev',
            onPressed: () {
              _pageController.previousPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            backgroundColor: Colors.white.withOpacity(0.9),
            child: const Icon(Icons.arrow_back, color: Color(0xFF667EEA)),
          ),
          const SizedBox(width: 20),
          FloatingActionButton(
            heroTag: 'next',
            onPressed: () {
              _pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            backgroundColor: Colors.white.withOpacity(0.9),
            child: const Icon(Icons.arrow_forward, color: Color(0xFF667EEA)),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
