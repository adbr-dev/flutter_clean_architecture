import 'dart:developer';

import '../../data/sources/local/local_data_source.dart';

class RemoveBookmarkUrlUseCase {
  RemoveBookmarkUrlUseCase(this._localDataSource);

  final LocalDataSource _localDataSource;

  void call(String url) {
    final bookmarkUrls = _localDataSource.bookmarkUrls.toList();
    bookmarkUrls.remove(url);
    _localDataSource.bookmarkUrls = bookmarkUrls;

    log('${_localDataSource.bookmarkUrls}');
  }
}
