import 'package:shrimp/const.dart';
import 'package:flutter/material.dart';

class TextCustome extends StatelessWidget {
  final String text;
  TextCustome({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
    );
  }
}
