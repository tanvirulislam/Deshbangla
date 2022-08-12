// ignore_for_file: prefer_const_constructors

import 'package:shrimp/const.dart';
import 'package:shrimp/widgets/text_field.dart';
import 'package:flutter/material.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Image.asset(
            'assets/logo.png',
            width: 300,
            height: 150,
          ),
          Divider(),
          ListTile(
              iconColor: primaryColor,
              leading: Icon(Icons.home_outlined),
              title: TextCustome(text: 'Home')),
          ListTile(
              iconColor: primaryColor,
              leading: Icon(Icons.favorite_outline),
              title: TextCustome(text: 'Favorite')),
          ListTile(
              iconColor: primaryColor,
              leading: Icon(Icons.shopping_bag_outlined),
              title: TextCustome(text: 'Cart')),
          ListTile(
              iconColor: primaryColor,
              leading: Icon(Icons.shopping_cart_outlined),
              title: TextCustome(text: 'Orders')),
          ListTile(
              iconColor: primaryColor,
              leading: Icon(Icons.account_tree),
              title: TextCustome(text: 'Account'))
        ],
      ),
      semanticLabel: 'dfdfd',
    );
  }
}
