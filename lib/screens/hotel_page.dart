import 'package:flutter/material.dart';
import 'package:GoTravel/core/data/hotel_list.dart';
import 'package:GoTravel/core/models/hotel.dart';
import 'package:GoTravel/components/hotel_navbar.dart';
import 'package:GoTravel/components/hotel_carousel.dart';
import 'package:GoTravel/components/hotel_list.dart';

class HotelPage extends StatefulWidget {
  const HotelPage({super.key});

  @override
  State<HotelPage> createState() => _HotelPageState();
}

class _HotelPageState extends State<HotelPage> {
  List<Hotel> filteredHotels = [];
  String searchQuery = '';

  final List<String> jumbotronImages = [
    'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/travel-banner-design-template-92eca7f18429e60521c0f059071982d5_screen.jpg?ts=1732705338',
    'https://img.freepik.com/premium-psd/free-psd-banner-travel-tour-journey-immigration-study-abroad-template-editable-layers_839034-347.jpg?semt=ais_hybrid',
    'https://www.shutterstock.com/shutterstock/photos/1386268178/display_1500/stock-vector-travel-banner-design-with-famous-landmarks-for-popular-travel-blog-landing-page-or-tourism-website-1386268178.jpg',
  ];

  @override
  void initState() {
    super.initState();
    filteredHotels = List.from(allHotels);
  }

  void filterHotels(String query) {
    setState(() {
      searchQuery = query;
      filteredHotels = allHotels
          .where((hotel) =>
              hotel.title.toLowerCase().contains(query.toLowerCase()) ||
              hotel.address.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            HotelNavbar(onSearch: filterHotels), // ✅ Navbar stays fixed
            Expanded(
              child: ListView(
                children: [
                  HotelCarousel(images: jumbotronImages), // ✅ Carousel inside ListView
                  HotelList(hotels: filteredHotels), // ✅ List of hotels
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
