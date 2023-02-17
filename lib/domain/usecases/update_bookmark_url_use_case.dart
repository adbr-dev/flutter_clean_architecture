import 'dart:developer';

import '../../data/sources/local/local_data_source.dart';

/// 주어진 URL이 북마크 목록에
/// 이미 있는 경우 해당 URL을 삭제하고,
/// 없는 경우 추가합니다.
class UpdateBookmarkUrlUseCase {
  UpdateBookmarkUrlUseCase(this._localDataSource);

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
