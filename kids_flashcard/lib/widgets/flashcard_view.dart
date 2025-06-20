import 'package:flutter/material.dart';
import '../models/flashcard.dart';

class FlashcardView extends StatefulWidget {
  final Flashcard flashcard;
  final VoidCallback? onTap;

  const FlashcardView({
    super.key,
    required this.flashcard,
    this.onTap,
  });

  @override
  State<FlashcardView> createState() => _FlashcardViewState();
}

class _FlashcardViewState extends State<FlashcardView> {
  bool _isShowingQuestion = true;

  @override
  void didUpdateWidget(FlashcardView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.flashcard.id != widget.flashcard.id) {
      setState(() {
        _isShowingQuestion = true;
      });
    }
  }

  void _flipCard() {
    setState(() {
      _isShowingQuestion = !_isShowingQuestion;
    });
    widget.onTap?.call();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _flipCard,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return ScaleTransition(
            scale: animation,
            child: child,
          );
        },
        child: _buildCard(
          _isShowingQuestion ? widget.flashcard.question : widget.flashcard.answer,
          key: ValueKey(_isShowingQuestion),
        ),
      ),
    );
  }

  Widget _buildCard(String text, {Key? key}) {
    return Container(
      key: key,
      width: 300,
      height: 400,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: widget.flashcard.color,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                widget.flashcard.color,
                widget.flashcard.color.withOpacity(0.8),
              ],
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}