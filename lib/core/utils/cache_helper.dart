import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/BookModel.dart';

class CacheHelper {
  static SharedPreferences? sharedPreferences;

  static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static void saveBookModelToSharedPreferences(BookModel bookModel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('bookModel', jsonEncode(bookModel.toJson()));
  }

  static void saveSearchWord(value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("searchWord", value);
  }

  static Future<String> getSearchWord(key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getString(key);

    return key;
  }
}
