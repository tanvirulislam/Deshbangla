// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, prefer_const_literals_to_create_immutables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shrimp/widgets/button.dart';

Widget SliderDeshbangla() {
  List<String> sliderPhoto = [
    'assets/banner1.jpg',
    'assets/banner2.jpg',
    'assets/banner3.jpg',
  ];

  List<String> sliderTitle = [
    'dfdfdfdf',
    'dfdfdfdf',
  ];

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 5),
    child: Container(
      margin: EdgeInsets.only(top: 5),
      height: 200,
      width: 300,
      child: CarouselSlider(
        options: CarouselOptions(
          height: 400,
          aspectRatio: 16 / 9,
          viewportFraction: 1,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: false,
          scrollDirection: Axis.horizontal,
        ),
        items: sliderPhoto.map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Card(
                elevation: 3,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                    child: Row(
                      children: [
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'To provide you all type of Fish and Shrimp',
                              style: TextStyle(color: Colors.lightGreen),
                            ),
                            SizedBox(
                              height: 65,
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                'The fish is very fresh, and it stored without any formalin. The fish is very fresh, and it stored without any formalin. The fish is very fresh, and it stored without any formalin.',
                                textAlign: TextAlign.justify,
                                overflow: TextOverflow.clip,
                              ),
                            ),
                            ButtonCustome(function: () {}, title: 'Buy now')
                          ],
                        )),
                        SizedBox(width: 8),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                  image: AssetImage(i), fit: BoxFit.cover),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }).toList(),
      ),
    ),
  );
}
