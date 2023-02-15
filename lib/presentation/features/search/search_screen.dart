import 'package:easy_debounce/easy_debounce.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/presentation/features/search/search_controller.dart';
import 'package:flutter_clean_architecture/presentation/utils/util_colors.dart';
import 'package:flutter_clean_architecture/presentation/utils/util_size.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({
    super.key,
    required this.controller,
  });

  final SearchController controller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('search'),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: UtilSize.spaceHorizontal,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: UtilSize.paddingHorizontal,
              ),
              child: Form(
                child: TextFormField(
                  autofocus: true,
                  decoration: _inputDecoration,
                  cursorHeight: 22.0,
                  textInputAction: TextInputAction.search,
                  onChanged: (value) {
                    if (value.isEmpty) return;

                    EasyDebounce.debounce(
                      'search_query',
                      const Duration(seconds: 1),
                      () => controller.onSearchQuery(value),
                    );
                  },
                  onSaved: (value) {
                    if (value?.isNotEmpty ?? false) {
                      controller.onSearchQuery(value!);
                    }
                  },
                ),
              ),
            ),
            const SizedBox(
              height: UtilSize.spaceHorizontal,
            ),
            Expanded(
              child: AnimatedBuilder(
                animation: controller,
                builder: (context, _) => ListView.builder(
                  padding: const EdgeInsets.symmetric(
                    horizontal: UtilSize.paddingHorizontal,
                  ),
                  itemBuilder: _buildListTileCard,
                  itemCount: controller.documents.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListTileCard(BuildContext context, int index) {
    final doc = controller.documents[index];
    const imageSize = 50.0;

    return Card(
      child: ListTile(
        leading: ExtendedImage.network(
          doc.imageUrl,
          cacheWidth: imageSize.toInt(),
          cacheHeight: imageSize.toInt(),
          cache: true,
          clearMemoryCacheIfFailed: true,
          clearMemoryCacheWhenDispose: true,
          compressionRatio: .5,
          loadStateChanged: (state) {
            switch (state.extendedImageLoadState) {
              case LoadState.loading:
                return const Icon(Icons.photo);
              case LoadState.completed:
                return ExtendedRawImage(
                  key: Key(doc.imageUrl),
                  image: state.extendedImageInfo?.image,
                  fit: BoxFit.cover,
                  width: imageSize,
                  height: imageSize,
                );
              case LoadState.failed:
                return const Icon(Icons.cloud_off_rounded);
            }
          },
        ),
        title: Text(doc.displaySitename),
        trailing: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.star_border),
        ),
      ),
    );
  }

  InputDecoration get _inputDecoration {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        UtilSize.borderRadius,
      ),
      borderSide: BorderSide.none,
    );

    return InputDecoration(
      filled: true,
      fillColor: Colors.white,
      hintText: '검색할 키워드를 입력해주세요.',
      enabledBorder: border,
      focusedBorder: border.copyWith(
        borderSide: const BorderSide(color: UtilColors.main),
      ),
      errorBorder: border.copyWith(
        borderSide: const BorderSide(color: Colors.red),
      ),
      border: border,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      prefixIcon: const Icon(
        Icons.search,
        size: 16,
      ),
    );
  }
}
