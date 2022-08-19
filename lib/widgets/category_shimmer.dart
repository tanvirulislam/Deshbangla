// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CategoryShimmer extends StatelessWidget {
  const CategoryShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Shimmer.fromColors(
      baseColor: Colors.white,
      highlightColor: Colors.grey.shade300,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 2,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 175,
              width: screenSize.width / 3,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(13),
              ),
            ),
          );
        },
      ),
    );
  }
}
