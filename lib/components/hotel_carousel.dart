import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HotelCarousel extends StatefulWidget {
  final List<String> images;

  const HotelCarousel({super.key, required this.images});

  @override
  _HotelCarouselState createState() => _HotelCarouselState();
}

class _HotelCarouselState extends State<HotelCarousel> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200.0,
        autoPlay: true,
        enlargeCenterPage: false,
        viewportFraction: 1.0,
        autoPlayInterval: Duration(seconds: 3),
        onPageChanged: (index, reason) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      items: widget.images.map((image) {
        return ClipRRect(
          child: Image.network(
            image,
            fit: BoxFit.cover,
            width: double.infinity,
            errorBuilder: (context, error, stackTrace) =>
                Icon(Icons.broken_image, size: 200),
          ),
        );
      }).toList(),
    );
  }
}
