import 'package:flutter/services.dart';

class TtsService {
  static const MethodChannel _channel = MethodChannel('kids_flashcard/tts');

  static Future<void> speak(String text) async {
    try {
      await _channel.invokeMethod('speak', {'text': text});
    } on PlatformException catch (e) {
      print('TTS Error: ${e.message}');
    }
  }

  static Future<void> stop() async {
    try {
      await _channel.invokeMethod('stop');
    } on PlatformException catch (e) {
      print('TTS Stop Error: ${e.message}');
    }
  }

  static Future<bool> isLanguageAvailable(String language) async {
    try {
      final result = await _channel.invokeMethod('isLanguageAvailable', {
        'language': language,
      });
      return result as bool;
    } on PlatformException catch (e) {
      print('TTS Language Check Error: ${e.message}');
      return false;
    }
  }

  static Future<void> setLanguage(String language) async {
    try {
      await _channel.invokeMethod('setLanguage', {
        'language': language,
      });
    } on PlatformException catch (e) {
      print('TTS Set Language Error: ${e.message}');
    }
  }

  static Future<void> setSpeechRate(double rate) async {
    try {
      await _channel.invokeMethod('setSpeechRate', {
        'rate': rate,
      });
    } on PlatformException catch (e) {
      print('TTS Set Speech Rate Error: ${e.message}');
    }
  }
}