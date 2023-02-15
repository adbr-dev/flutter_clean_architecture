import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_clean_architecture/data/models/search_image_model.dart';
import 'package:flutter_clean_architecture/domain/usecases/fetch_search_image_use_case.dart';

import '../../../domain/repositories/search_repository.dart';

class SearchController with ChangeNotifier {
  SearchController(this._repository);

  final SearchRepository _repository;
  final _documents = <ImageDocument>[];

  List<ImageDocument> get documents => _documents.toList();

  void onSearchQuery(String value) async {
    final usecase = FetchSearchImageUseCase(_repository);
    const page = 1;

    final result = await usecase.call(query: value, page: page);
    _documents.clear();
    _documents.addAll(result.documents);

    log('documents ${_documents.length}');

    notifyListeners();
  }
}
