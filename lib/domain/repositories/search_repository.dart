import 'package:flutter_clean_architecture/data/models/search_image_model.dart';
import 'package:http/http.dart';

import '../../data/sources/api_client.dart';

abstract class SearchRepository {
  SearchRepository({ApiClient? client})
      : client = client ?? ApiClient(client: Client());

  final ApiClient client;

  /// search-image
  ///
  /// api docs: https://developers.kakao.com/docs/latest/ko/daum-search/dev-guide#search-image
  Future<SearchImageModel> searchImage(
      {required String query, String? sort, int? page, int? size});
}
