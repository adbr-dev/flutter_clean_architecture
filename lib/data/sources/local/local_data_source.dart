import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDataSource with ChangeNotifier {
  late SharedPreferences _sharedPreference;

  final keyBookmarkUrls = 'bookmark_urls';

  Future<void> load() async {
    _sharedPreference = await SharedPreferences.getInstance();
  }

  set bookmarkUrls(List<String> value) {
    _sharedPreference.setStringList(keyBookmarkUrls, value);
    notifyListeners();
  }

  List<String> get bookmarkUrls =>
      _sharedPreference.getStringList(keyBookmarkUrls) ?? [];
}
