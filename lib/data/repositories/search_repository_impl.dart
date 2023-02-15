import '../../domain/repositories/search_repository.dart';
import '../models/search_image_model.dart';
import '../sources/api_client.dart';

class SearchRepositoryImpl extends SearchRepository {
  SearchRepositoryImpl({ApiClient? client}) : super(client: client);

  @override
  Future<SearchImageModel> searchImage(
      {required String query, String? sort, int? page, int? size}) {
    final result = client.searchImage(query: query);
    return result;
  }
}
