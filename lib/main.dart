import 'package:flutter/material.dart';

import 'data/sources/local/local_data_source.dart';
import 'presentation/features/home/home_page.dart';
import 'presentation/utils/util_colors.dart';

final localDataSource = LocalDataSource();

void main() async {
  await localDataSource.load();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: UtilColors.main,
        backgroundColor: UtilColors.background,
      ),
      home: const HomePage(),
    );
  }
}
