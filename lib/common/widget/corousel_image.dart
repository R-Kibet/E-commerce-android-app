import 'package:amazon_clone/constants/global.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Carousel extends StatelessWidget {
  const Carousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        options: CarouselOptions(
            viewportFraction: 1,
             height: 200,
        ),
        items: GlobalVariables.carouselImages.map((i) {
          return Builder(
              builder: (BuildContext context) => Image.network(
                i,
                fit: BoxFit.cover,
                height: 200,
              ),
          );
        },
        ).toList(),
    );
  }
}
