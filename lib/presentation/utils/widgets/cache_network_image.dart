import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class CacheNetworkImage extends StatelessWidget {
  const CacheNetworkImage({
    super.key,
    required this.url,
    this.width,
    this.height,
    this.compressionRatio = 0.5,
  });

  final String url;
  final double? width;
  final double? height;
  final double? compressionRatio;

  @override
  Widget build(BuildContext context) {
    return ExtendedImage.network(
      url,
      cacheWidth: width?.toInt(),
      cacheHeight: height?.toInt(),
      cache: true,
      clearMemoryCacheIfFailed: true,
      clearMemoryCacheWhenDispose: true,
      compressionRatio: compressionRatio,
      loadStateChanged: (state) {
        switch (state.extendedImageLoadState) {
          case LoadState.loading:
            return const Icon(Icons.photo);
          case LoadState.completed:
            return ExtendedRawImage(
              key: Key(url),
              image: state.extendedImageInfo?.image,
              fit: BoxFit.cover,
              width: width,
              height: height,
            );
          case LoadState.failed:
            return const Icon(Icons.cloud_off_rounded);
        }
      },
    );
  }
}
