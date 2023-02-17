import 'package:flutter/material.dart';

import '../../utils/widgets/cache_network_image.dart';

class ImageDetailPage extends StatelessWidget {
  const ImageDetailPage({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: CacheNetworkImage(
        url: imageUrl,
        compressionRatio: 0,
      ),
    );
  }
}
