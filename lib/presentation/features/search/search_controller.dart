import 'dart:developer';

import 'package:flutter/foundation.dart';

import '../../../data/models/search_image_model.dart';
import '../../../domain/repositories/search_repository.dart';
import '../../../domain/usecases/fetch_search_image_use_case.dart';
import '../../../domain/usecases/update_bookmark_url_use_case.dart';
import '../../../main.dart';

class SearchController with ChangeNotifier {
  SearchController(this._repository);

  final SearchRepository _repository;
  final _documents = <ImageDocument>[];
  String? _query;

  List<ImageDocument> get documents => _documents.toList();
  String? get query => _query;

  void onClearQuery() {
    _documents.clear();
    notifyListeners();
  }

  void onSearchQuery(String query) async {
    final usecase = FetchSearchImageUseCase(_repository);
    const page = 1;

    final result = await usecase.call(query: query, page: page);
    _query = query;
    _documents.clear();
    _documents.addAll(result.documents);

    log('documents ${_documents.length}');

    notifyListeners();
  }

  void onAddBookmarkUrl(String url) {
    final usecase = UpdateBookmarkUrlUseCase(localDataSource);
    usecase.call(url);

    notifyListeners();
  }
}
