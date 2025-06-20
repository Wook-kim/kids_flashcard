import 'package:flutter/material.dart';

class Flashcard {
  final String id;
  final String question;
  final String answer;
  final Color color;
  final String category;

  Flashcard({
    required this.id,
    required this.question,
    required this.answer,
    required this.color,
    this.category = 'general',
  });

  factory Flashcard.fromJson(Map<String, dynamic> json) {
    return Flashcard(
      id: json['id'],
      question: json['question'],
      answer: json['answer'],
      color: Color(json['color']),
      category: json['category'] ?? 'general',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'question': question,
      'answer': answer,
      'color': color.value,
      'category': category,
    };
  }
}