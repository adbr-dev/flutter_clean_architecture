import 'package:easy_debounce/easy_debounce.dart';
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
                  onChanged: (value) => EasyDebounce.debounce(
                    'search_query',
                    const Duration(seconds: 1),
                    () => controller.onSearchQuery(value),
                  ),
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

    return Card(
      child: ListTile(
        leading: Image.network(
          doc.imageUrl,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
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
