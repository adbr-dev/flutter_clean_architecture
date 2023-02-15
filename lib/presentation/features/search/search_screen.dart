import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/presentation/utils/util_size.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('search'),
      ),
      body: Column(
        children: [
          Form(
            child: TextFormField(),
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
    );
  }
}
