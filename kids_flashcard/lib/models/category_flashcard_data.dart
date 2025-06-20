enum FlashcardCategory {
  animals('동물', '🦁'),
  food('음식', '🍔'),
  nature('자연', '🌿'),
  objects('사물', '📦'),
  transportation('교통', '🚗');

  final String korean;
  final String emoji;

  const FlashcardCategory(this.korean, this.emoji);
}

class CategoryFlashcardData {
  final String emoji;
  final String englishWord;
  final String koreanWord;
  final String description;
  final FlashcardCategory category;

  CategoryFlashcardData({
    required this.emoji,
    required this.englishWord,
    required this.koreanWord,
    required this.description,
    required this.category,
  });
}

// 카테고리별 플래시카드 데이터
final Map<FlashcardCategory, List<CategoryFlashcardData>> categoryFlashcards = {
  FlashcardCategory.animals: [
    CategoryFlashcardData(
      emoji: '🐶',
      englishWord: 'DOG',
      koreanWord: '강아지',
      description: '멍멍! 귀여운 친구',
      category: FlashcardCategory.animals,
    ),
    CategoryFlashcardData(
      emoji: '🐱',
      englishWord: 'CAT',
      koreanWord: '고양이',
      description: '야옹야옹 울어요',
      category: FlashcardCategory.animals,
    ),
    CategoryFlashcardData(
      emoji: '🐘',
      englishWord: 'ELEPHANT',
      koreanWord: '코끼리',
      description: '긴 코를 가졌어요',
      category: FlashcardCategory.animals,
    ),
  ],
};  FlashcardCategory.food: [
    CategoryFlashcardData(
      emoji: '🍎',
      englishWord: 'APPLE',
      koreanWord: '사과',
      description: '빨간 과일이에요',
      category: FlashcardCategory.food,
    ),
    CategoryFlashcardData(
      emoji: '🍕',
      englishWord: 'PIZZA',
      koreanWord: '피자',
      description: '맛있는 이탈리아 음식',
      category: FlashcardCategory.food,
    ),
    CategoryFlashcardData(
      emoji: '🍦',
      englishWord: 'ICE CREAM',
      koreanWord: '아이스크림',
      description: '시원하고 달콤해요',
      category: FlashcardCategory.food,
    ),
  ],
  FlashcardCategory.nature: [
    CategoryFlashcardData(
      emoji: '🌟',
      englishWord: 'STAR',
      koreanWord: '별',
      description: '밤하늘에 반짝반짝',
      category: FlashcardCategory.nature,
    ),
    CategoryFlashcardData(
      emoji: '🌈',
      englishWord: 'RAINBOW',
      koreanWord: '무지개',
      description: '비온 뒤 하늘에',
      category: FlashcardCategory.nature,
    ),
    CategoryFlashcardData(
      emoji: '🌻',
      englishWord: 'SUNFLOWER',
      koreanWord: '해바라기',
      description: '태양을 바라봐요',
      category: FlashcardCategory.nature,
    ),
  ],
};