class SearchImageModel {
  SearchImageModel({
    required this.totalCount,
    required this.pageableCount,
    required this.isEnd,
    required this.documents,
  });

  final int totalCount;
  final int pageableCount;
  final bool isEnd;
  final List<ImageDocument> documents;

  factory SearchImageModel.fromJson(Map<String, dynamic> json) {
    final jsonDocuments = json['documents'] as List;
    final documents = <ImageDocument>[];
    for (var jsonDocument in jsonDocuments) {
      documents.add(ImageDocument.fromJson(jsonDocument));
    }

    return SearchImageModel(
      totalCount: json['meta']['total_count'],
      pageableCount: json['meta']['pageable_count'],
      isEnd: json['meta']['is_end'],
      documents: documents,
    );
  }
}

class ImageDocument {
  ImageDocument({
    required this.collection,
    required this.thumbnailUrl,
    required this.imageUrl,
    required this.width,
    required this.height,
    required this.displaySitename,
    required this.docUrl,
    required this.datetime,
  });

  final String collection;
  final String thumbnailUrl;
  final String imageUrl;
  final int width;
  final int height;
  final String displaySitename;
  final String docUrl;
  final DateTime datetime;

  factory ImageDocument.fromJson(Map json) {
    return ImageDocument(
      collection: json['collection'],
      thumbnailUrl: json['thumbnail_url'],
      imageUrl: json['image_url'],
      width: json['width'],
      height: json['height'],
      displaySitename: json['display_sitename'],
      docUrl: json['doc_url'],
      datetime: DateTime.parse(json['datetime']).toLocal(),
    );
  }
}
