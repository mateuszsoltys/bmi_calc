import 'package:flutter/material.dart';
import 'data/theme/theme_data.dart';
import 'features/home_page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI CALC',
      theme: appTheme(),
      home: const HomePage(),
    );
  }
}
