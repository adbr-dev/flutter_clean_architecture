import 'package:flutter/services.dart';
import 'package:http/http.dart';

import '../models/search_image_model.dart';
import 'api_config.dart';
import 'api_request.dart';

class ApiClient {
  ApiClient({
    required this.client,
    ApiRequest? request,
  }) : _request = request ?? ApiRequest(client);

  final Client client;
  final ApiRequest _request;

  Future<SearchImageModel> searchImage({
    required String query,
    String? sort,
    int? page,
    int? size,
  }) async {
    const url = '${ApiConfig.baseUrl}/v2/search/image';
    final params = <String, dynamic>{};
    params['query'] = query;
    if (sort?.isNotEmpty ?? false) {
      params['sort'] = sort;
    }
    if (page != null) {
      params['page'] = page;
    }
    if (size != null) {
      params['size'] = size;
    }

    final response = await _request(
      method: RequestMethod.get,
      headers: ApiConfig.headers,
      url: url,
      params: params,
    );

    if (response.statusCode == 200) {
      return SearchImageModel.fromJson(response.body);
    } else {
      throw PlatformException(
        code: 'SYSTEM_ERROR',
        details: {
          'statusCode': response.statusCode,
          'body': response.body ?? '',
        },
      );
    }
  }
}
