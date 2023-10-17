import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselWithDummyImages extends StatelessWidget {
  const CarouselWithDummyImages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Carousel with Dummy Images'),
        ),
        body: Center(
          child: CarouselSlider(
            items: [
              Image.asset('assets/dummy_image.png'),
              Image.asset('assets/dummy_image.png'),
              Image.asset('assets/dummy_image.png'),
            ],
            options: CarouselOptions(
              height: 200.0,
              autoPlay: true,
              autoPlayAnimationDuration: const Duration(seconds: 2),
            ),
          ),
        ),
      ),
    );
  }
}