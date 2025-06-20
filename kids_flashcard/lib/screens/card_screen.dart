import 'package:flutter/material.dart';
import '../models/flashcard.dart';
import '../widgets/flashcard_view.dart';

class CardScreen extends StatefulWidget {
  final String category;

  const CardScreen({
    super.key,
    required this.category,
  });

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  int _currentCardIndex = 0;
  late List<Flashcard> _flashcards;

  @override
  void initState() {
    super.initState();
    _flashcards = _getFlashcardsByCategory(widget.category);
  }

  List<Flashcard> _getFlashcardsByCategory(String category) {
    switch (category) {
      case '색깔 배우기':
        return [
          Flashcard(
            id: '1',
            question: "빨강과 노랑을 섞으면 무슨 색이 될까요?",
            answer: "주황색! 🧡",
            color: Colors.orange,
            category: '색깔',
          ),
          Flashcard(
            id: '2',
            question: "하늘의 색깔은 무엇일까요?",
            answer: "파란색! 💙",
            color: Colors.blue,
            category: '색깔',
          ),
          Flashcard(
            id: '3',
            question: "나뭇잎의 색깔은 무엇일까요?",
            answer: "초록색! 💚",
            color: Colors.green,
            category: '색깔',
          ),
        ];
      case '동물 친구들':
        return [
          Flashcard(
            id: '4',
            question: "거미의 다리는 몇 개일까요?",
            answer: "8개! 🕷️",
            color: Colors.purple,
            category: '동물',
          ),
          Flashcard(
            id: '5',
            question: "소는 어떤 소리를 낼까요?",
            answer: "음메! 🐄",
            color: Colors.green,
            category: '동물',
          ),
          Flashcard(
            id: '6',
            question: "고양이는 어떤 소리를 낼까요?",
            answer: "야옹! 🐱",
            color: Colors.orange,
            category: '동물',
          ),
        ];
      case '숫자 놀이':
        return [
          Flashcard(
            id: '7',
            question: "2 + 3은 얼마일까요?",
            answer: "5! ✋",
            color: Colors.blue,
            category: '수학',
          ),
          Flashcard(
            id: '8',
            question: "1 + 1은 얼마일까요?",
            answer: "2! ✌️",
            color: Colors.cyan,
            category: '수학',
          ),
          Flashcard(
            id: '9',
            question: "5 - 2는 얼마일까요?",
            answer: "3! 👌",
            color: Colors.indigo,
            category: '수학',
          ),
        ];
      case '자연 탐험':
        return [
          Flashcard(
            id: '10',
            question: "벌들이 만드는 것은 무엇일까요?",
            answer: "꿀! 🍯",
            color: Colors.yellow,
            category: '자연',
          ),
          Flashcard(
            id: '11',
            question: "비가 온 후에 하늘에 나타나는 것은?",
            answer: "무지개! 🌈",
            color: Colors.pink,
            category: '자연',
          ),
          Flashcard(
            id: '12',
            question: "밤에 하늘에서 빛나는 것은?",
            answer: "별! ⭐",
            color: Colors.deepPurple,
            category: '자연',
          ),
        ];
      default:
        return [];
    }
  }

  void _nextCard() {
    setState(() {
      _currentCardIndex = (_currentCardIndex + 1) % _flashcards.length;
    });
  }

  void _previousCard() {
    setState(() {
      _currentCardIndex = _currentCardIndex == 0
          ? _flashcards.length - 1
          : _currentCardIndex - 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_flashcards.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.category),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        body: const Center(
          child: Text('플래시카드가 없습니다.'),
        ),
      );
    }

    final currentCard = _flashcards[_currentCardIndex];

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(
          widget.category,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: currentCard.color,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: Text(
              '카드 ${_currentCardIndex + 1} / ${_flashcards.length}',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: currentCard.color,
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: FlashcardView(
                flashcard: currentCard,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _previousCard,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[600],
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.arrow_back),
                      SizedBox(width: 5),
                      Text('이전'),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: _nextCard,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[600],
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('다음'),
                      SizedBox(width: 5),
                      Icon(Icons.arrow_forward),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}