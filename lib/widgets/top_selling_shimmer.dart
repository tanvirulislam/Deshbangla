import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class TopSellingShimmer extends StatelessWidget {
  const TopSellingShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Shimmer.fromColors(
      baseColor: Colors.white,
      highlightColor: Colors.grey.shade300,
      child: Container(
        margin: EdgeInsets.only(left: 8, right: 8),
        child: GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: screenSize.width < 400 ? 2 : 4,
          ),
          itemCount: 4,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 4,
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Container(
                      width: screenSize.width,
                      height: 80,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
