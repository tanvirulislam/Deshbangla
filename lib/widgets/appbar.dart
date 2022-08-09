// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class AppbarCustome extends StatelessWidget {
  const AppbarCustome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return AppBar(
      elevation: 3,
      backgroundColor: Colors.white,
      title: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Image.asset(
          'assets/logo.png',
          width: 150,
        ),
      ),
      iconTheme: IconThemeData(color: Colors.green),
      actions: [Icon(Icons.search_outlined), SizedBox(width: 8)],
    );
  }
}
