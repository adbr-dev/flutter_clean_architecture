import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/presentation/utils/util_colors.dart';
import 'package:flutter_clean_architecture/presentation/utils/util_size.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

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
                  onChanged: (value) {},
                ),
              ),
            ),
            const SizedBox(
              height: UtilSize.spaceHorizontal,
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: UtilSize.paddingHorizontal,
                ),
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: Image.network(
                        'https://blog.logrocket.com/wp-content/uploads/2021/04/Building-Flutter-desktop-app-tutorial-examples.png',
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      title: const Text('sitename'),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.star_border),
                      ),
                    ),
                  );
                },
                itemCount: 100,
              ),
            )
          ],
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
