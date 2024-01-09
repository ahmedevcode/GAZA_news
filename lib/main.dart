import 'package:flutter/material.dart';
import 'package:news_apps/views/home_view.dart';
import 'package:news_apps/widgets/splashscreen.dart';

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

