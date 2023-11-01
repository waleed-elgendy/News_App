import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Pages/HomePage.dart';
import 'package:news_app/Services/GetNews.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}

