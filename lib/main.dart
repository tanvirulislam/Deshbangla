// ignore_for_file: prefer_const_constructors

import 'package:deshbangla_fatch_api/const.dart';
import 'package:deshbangla_fatch_api/screens/banner.dart';
import 'package:deshbangla_fatch_api/screens/home.dart';
import 'package:deshbangla_fatch_api/model/category_model.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Deshbangla',
      theme: ThemeData(
        // primaryIconTheme: IconThemeData(color: Colors.amber),
        primarySwatch: Colors.lightGreen,
        // primaryColor: primaryColor,
      ),
      home: HomeScreen(),
    );
  }
}
