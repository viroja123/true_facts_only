import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/fact.dart';

class BookmarkProvider with ChangeNotifier {
  List<Fact> _bookmarkedFacts = [];

  List<Fact> get bookmarkedFacts => _bookmarkedFacts;

  Future<void> loadBookmarks() async {
    final prefs = await SharedPreferences.getInstance();
    final String? bookmarksJson = prefs.getString('bookmarks');
    if (bookmarksJson != null) {
      final List<dynamic> decoded = jsonDecode(bookmarksJson);
      _bookmarkedFacts = decoded.map((item) => Fact.fromJson(item)).toList();
      notifyListeners();
    }
  }

  Future<void> saveBookmarks() async {
    final prefs = await SharedPreferences.getInstance();
    final List<Map<String, dynamic>> mapped = _bookmarkedFacts
        .map((e) => e.toJson())
        .toList();
    await prefs.setString('bookmarks', jsonEncode(mapped));
  }

  void toggleBookmark(Fact fact) {
    final index = _bookmarkedFacts.indexWhere(
      (element) => element.id == fact.id,
    );
    if (index >= 0) {
      _bookmarkedFacts.removeAt(index);
    } else {
      _bookmarkedFacts.add(fact);
    }
    saveBookmarks();
    notifyListeners();
  }

  bool isBookmarked(String factId) {
    return _bookmarkedFacts.any((element) => element.id == factId);
  }
}
