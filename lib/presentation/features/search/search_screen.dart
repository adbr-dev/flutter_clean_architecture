import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';

import '../../../main.dart';
import '../../utils/util_colors.dart';
import '../../utils/util_size.dart';
import '../../utils/widgets/cache_network_image.dart';
import 'search_controller.dart';

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
    final hasBookmark = localDataSource.bookmarkUrls.contains(doc.imageUrl);

    return Card(
      child: ListTile(
        leading: CacheNetworkImage(
          url: doc.imageUrl,
          width: imageSize,
          height: imageSize,
        ),
        title: Text(doc.displaySitename),
        trailing: IconButton(
          onPressed: () {
            controller.onAddBookmarkUrl(doc.imageUrl);
          },
          icon: Icon(hasBookmark ? Icons.star : Icons.star_border),
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
