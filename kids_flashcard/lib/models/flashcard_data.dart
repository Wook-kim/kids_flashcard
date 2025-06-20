class FlashcardData {
  final String emoji;
  final String englishWord;
  final String koreanWord;
  final String description;

  FlashcardData({
    required this.emoji,
    required this.englishWord,
    required this.koreanWord,
    required this.description,
  });
}

// 샘플 데이터
final List<FlashcardData> sampleFlashcards = [
  FlashcardData(
    emoji: '🍎',
    englishWord: 'APPLE',
    koreanWord: '사과',
    description: '빨간 과일이에요',
  ),
  FlashcardData(
    emoji: '🐶',
    englishWord: 'DOG',
    koreanWord: '강아지',
    description: '멍멍! 귀여운 친구',
  ),
  FlashcardData(
    emoji: '🌟',
    englishWord: 'STAR',
    koreanWord: '별',
    description: '밤하늘에 반짝반짝',
  ),
  FlashcardData(
    emoji: '🚗',
    englishWord: 'CAR',
    koreanWord: '자동차',
    description: '부릉부릉 달려요',
  ),
  FlashcardData(
    emoji: '🌈',
    englishWord: 'RAINBOW',
    koreanWord: '무지개',
    description: '비온 뒤 하늘에',
  ),
  FlashcardData(
    emoji: '🎈',
    englishWord: 'BALLOON',
    koreanWord: '풍선',
    description: '둥둥 떠다녀요',
  ),
  FlashcardData(
    emoji: '🍕',
    englishWord: 'PIZZA',
    koreanWord: '피자',
    description: '맛있는 이탈리아 음식',
  ),
  FlashcardData(
    emoji: '📚',
    englishWord: 'BOOK',
    koreanWord: '책',
    description: '재미있는 이야기가 가득',
  ),
  FlashcardData(
    emoji: '🌳',
    englishWord: 'TREE',
    koreanWord: '나무',
    description: '숲에서 자라요',
  ),
  FlashcardData(
    emoji: '🏠',
    englishWord: 'HOUSE',
    koreanWord: '집',
    description: '우리가 사는 곳',
  ),
  FlashcardData(
    emoji: '✈️',
    englishWord: 'AIRPLANE',
    koreanWord: '비행기',
    description: '하늘을 날아요',
  ),
  FlashcardData(
    emoji: '🌙',
    englishWord: 'MOON',
    koreanWord: '달',
    description: '밤에 빛나요',
  ),
  FlashcardData(
    emoji: '🐱',
    englishWord: 'CAT',
    koreanWord: '고양이',
    description: '야옹야옹 울어요',
  ),
  FlashcardData(
    emoji: '🌻',
    englishWord: 'SUNFLOWER',
    koreanWord: '해바라기',
    description: '태양을 바라봐요',
  ),
  FlashcardData(
    emoji: '🚌',
    englishWord: 'BUS',
    koreanWord: '버스',
    description: '많은 사람을 태워요',
  ),
];
