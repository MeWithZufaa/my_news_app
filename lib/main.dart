import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_news_app/screens/category/categories/bbc_news_screen.dart';
import 'package:my_news_app/screens/main_screen/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Global News',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home:  MainScreen(),
    );
  }
}

