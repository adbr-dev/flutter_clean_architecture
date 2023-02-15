import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/presentation/features/home/home_page.dart';
import 'package:flutter_clean_architecture/presentation/utils/util_colors.dart';

void main() {
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
