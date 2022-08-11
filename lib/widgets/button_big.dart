import 'package:deshbangla_fatch_api/const.dart';
import 'package:flutter/material.dart';

class ButtonBig extends StatelessWidget {
  String title;
  Color titleColor;
  Color containerColor;
  VoidCallback ontap;
  ButtonBig(
      {Key? key,
      required this.title,
      required this.titleColor,
      required this.containerColor,
      required this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 60,
        width: screenSize.width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(40),
          border: Border.all(color: primaryColor),
        ),
        child: Text(
          title,
          style: TextStyle(color: titleColor),
          textScaleFactor: 1.4,
        ),
      ),
    );
  }
}
