import 'package:flutter_clean_architecture/domain/repositories/search_repository.dart';

import '../../data/models/search_image_model.dart';

class FetchSearchImageUseCase {
  FetchSearchImageUseCase(this._repository);

  final SearchRepository _repository;

  Future<SearchImageModel> call({required String query, required int page}) {
    const size = 30;

    return _repository.searchImage(
      query: query,
      page: page,
      size: size,
    );
  }
}
