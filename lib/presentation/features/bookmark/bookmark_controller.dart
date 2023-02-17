import 'package:flutter/material.dart';

import '../../../domain/usecases/remove_bookmark_url_use_case.dart';
import '../../../main.dart';

class BookmarkController with ChangeNotifier {
  void onRemoveBookmark(String url) {
    final usecase = RemoveBookmarkUrlUseCase(localDataSource);
    usecase.call(url);

    notifyListeners();
  }
}
