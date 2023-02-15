import '../../domain/repositories/search_repository.dart';
import '../models/search_image_model.dart';

class SearchRepositoryImpl extends SearchRepository {
  SearchRepositoryImpl(super.client);

  @override
  Future<SearchImageModel> searchImage(
      {required String query, String? sort, int? page, int? size}) {
    final result = client.searchImage(query: query);
    return result;
  }
}
