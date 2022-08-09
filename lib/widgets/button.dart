// ignore_for_file: must_be_immutable, prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class ButtonCustome extends StatelessWidget {
  var function;
  final String title;

  ButtonCustome({Key? key, required this.function, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: function,
      child: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
