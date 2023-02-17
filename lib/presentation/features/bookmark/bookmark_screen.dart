import 'package:flutter/material.dart';

import '../../../main.dart';
import '../../utils/util_colors.dart';
import '../../utils/util_size.dart';
import '../../utils/widgets/cache_network_image.dart';
import 'bookmark_controller.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key, required this.controller});

  final BookmarkController controller;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final starButtonSize = width * 1 / 9;

    return Scaffold(
      appBar: AppBar(
        title: const Text('bookmark'),
      ),
      body: AnimatedBuilder(
        animation: controller,
        builder: (context, _) {
          return GridView.builder(
            padding: const EdgeInsets.symmetric(
              horizontal: UtilSize.paddingHorizontal,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
            ),
            itemCount: localDataSource.bookmarkUrls.length,
            itemBuilder: (context, index) {
              final bookmarkUrl = localDataSource.bookmarkUrls[index];

              return Stack(
                alignment: const Alignment(0.9, -1),
                children: [
                  CacheNetworkImage(
                    url: bookmarkUrl,
                    width: double.maxFinite,
                    height: double.maxFinite,
                  ),
                  IconButton(
                    onPressed: () => controller.onRemoveBookmark(bookmarkUrl),
                    icon: Icon(
                      Icons.star,
                      color: UtilColors.main,
                      size: starButtonSize,
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
