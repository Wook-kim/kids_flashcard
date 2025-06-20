import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/flashcard.dart';

class StorageService {
  static const String _flashcardsKey = 'saved_flashcards';
  static const String _progressKey = 'learning_progress';
  static const String _favoritesKey = 'favorite_cards';

  static Future<void> saveFlashcards(List<Flashcard> flashcards) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final jsonList = flashcards.map((card) => card.toJson()).toList();
      await prefs.setString(_flashcardsKey, jsonEncode(jsonList));
    } catch (e) {
      debugPrint('Error saving flashcards: $e');
    }
  }

  static Future<List<Flashcard>> loadFlashcards() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final jsonString = prefs.getString(_flashcardsKey);
      
      if (jsonString == null) return [];
      
      final jsonList = jsonDecode(jsonString) as List;
      return jsonList.map((json) => Flashcard.fromJson(json)).toList();
    } catch (e) {
      debugPrint('Error loading flashcards: $e');
      return [];
    }
  }

  static Future<void> saveProgress(String cardId, bool isCorrect) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final progressJson = prefs.getString(_progressKey) ?? '{}';
      final progress = jsonDecode(progressJson) as Map<String, dynamic>;
      
      if (progress[cardId] == null) {
        progress[cardId] = {
          'correct': 0,
          'incorrect': 0,
          'lastStudied': DateTime.now().toIso8601String(),
        };
      }
      
      if (isCorrect) {
        progress[cardId]['correct']++;
      } else {
        progress[cardId]['incorrect']++;
      }
      
      progress[cardId]['lastStudied'] = DateTime.now().toIso8601String();
      
      await prefs.setString(_progressKey, jsonEncode(progress));
    } catch (e) {
      debugPrint('Error saving progress: $e');
    }
  }

  static Future<Map<String, dynamic>> getProgress(String cardId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final progressJson = prefs.getString(_progressKey) ?? '{}';
      final progress = jsonDecode(progressJson) as Map<String, dynamic>;
      
      return progress[cardId] ?? {
        'correct': 0,
        'incorrect': 0,
        'lastStudied': null,
      };
    } catch (e) {
      debugPrint('Error getting progress: $e');
      return {
        'correct': 0,
        'incorrect': 0,
        'lastStudied': null,
      };
    }
  }

  static Future<void> addToFavorites(String cardId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final favorites = prefs.getStringList(_favoritesKey) ?? [];
      
      if (!favorites.contains(cardId)) {
        favorites.add(cardId);
        await prefs.setStringList(_favoritesKey, favorites);
      }
    } catch (e) {
      debugPrint('Error adding to favorites: $e');
    }
  }

  static Future<void> removeFromFavorites(String cardId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final favorites = prefs.getStringList(_favoritesKey) ?? [];
      
      favorites.remove(cardId);
      await prefs.setStringList(_favoritesKey, favorites);
    } catch (e) {
      debugPrint('Error removing from favorites: $e');
    }
  }

  static Future<List<String>> getFavorites() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getStringList(_favoritesKey) ?? [];
    } catch (e) {
      debugPrint('Error getting favorites: $e');
      return [];
    }
  }

  static Future<bool> isFavorite(String cardId) async {
    final favorites = await getFavorites();
    return favorites.contains(cardId);
  }

  static Future<void> clearAllData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_flashcardsKey);
      await prefs.remove(_progressKey);
      await prefs.remove(_favoritesKey);
    } catch (e) {
      debugPrint('Error clearing data: $e');
    }
  }
}