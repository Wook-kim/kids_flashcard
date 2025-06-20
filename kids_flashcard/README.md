# Kids Flashcard App

아이들을 위한 재미있고 교육적인 플래시카드 Flutter 앱입니다.

## 특징

- 🎨 화려하고 아이 친화적인 디자인
- 🔄 3D 카드 뒤집기 애니메이션
- 📱 터치 피드백 (햅틱)
- 🌈 다양한 색상 테마
- 📖 영어-한국어 학습

## 프로젝트 구조

```
lib/
├── main.dart                 # 앱 진입점
├── models/
│   └── flashcard_data.dart   # 플래시카드 데이터 모델
├── screens/
│   └── flashcard_screen.dart # 메인 플래시카드 화면
├── widgets/
│   ├── flashcard_widget.dart # 플래시카드 위젯
│   └── flashcard_theme.dart  # 색상 테마
└── utils/
    └── animation_utils.dart   # 애니메이션 유틸리티
```

## 실행 방법

1. Flutter가 설치되어 있는지 확인하세요
   ```bash
   flutter doctor
   ```

2. 의존성 설치
   ```bash
   flutter pub get
   ```

3. 앱 실행
   ```bash
   flutter run
   ```

## 커스터마이징

### 새로운 플래시카드 추가

`lib/models/flashcard_data.dart` 파일에서 `sampleFlashcards` 리스트에 새로운 항목을 추가하세요:

```dart
FlashcardData(
  emoji: '🎨',
  englishWord: 'ART',
  koreanWord: '미술',
  description: '그림을 그려요',
),
```

### 색상 테마 변경

`lib/widgets/flashcard_theme.dart` 파일에서 그라데이션 색상을 수정할 수 있습니다.

## 디자인 가이드라인

- **폰트 크기**: 영어 단어 48pt, 한글 48pt, 설명 28pt
- **카드 크기**: 300x400px
- **모서리 둥글기**: 20px
- **애니메이션**: 600ms 카드 뒤집기

## 라이선스

이 프로젝트는 교육 목적으로 만들어졌습니다.
