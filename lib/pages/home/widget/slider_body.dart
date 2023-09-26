import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SliderBody extends StatelessWidget {
  const SliderBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      
      options: CarouselOptions(
        viewportFraction: 0.8,
        height: 168,
        // aspectRatio: 2.0,
        enlargeCenterPage: true,
        enlargeStrategy: CenterPageEnlargeStrategy.height,
        autoPlay: true,
      ),
      items: List.generate(
        3,
        (index) => Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          child: Image.asset(
            'assets/images/image_slider.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
