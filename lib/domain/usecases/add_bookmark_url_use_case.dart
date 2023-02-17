import 'dart:developer';

import '../../data/sources/local/local_data_source.dart';

class AddBookmarkUrlUseCase {
  AddBookmarkUrlUseCase(this._localDataSource);

  final LocalDataSource _localDataSource;

  void call(String url) {
    final bookmarkUrls = _localDataSource.bookmarkUrls.toList();

    bookmarkUrls.contains(url)
        ? bookmarkUrls.remove(url)
        : bookmarkUrls.add(url);
    _localDataSource.bookmarkUrls = bookmarkUrls;

    log('${_localDataSource.bookmarkUrls}');
  }
}
