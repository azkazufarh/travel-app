import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myapp/components/hotel_carousel.dart';
import 'package:myapp/core/models/hotel.dart';

class HotelDetailPage extends StatelessWidget {
  final Hotel hotel;

  const HotelDetailPage({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    final currencyFormatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );

    return Scaffold(
      appBar: AppBar(title: Text(hotel.title)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1️⃣ Hero Section
            Stack(
              children: [
                HotelCarousel(images: hotel.images),
                Positioned(
                  top: 16,
                  right: 16,
                  child: Chip(
                    label: Text('Hotel'),
                    backgroundColor: Colors.blue.shade700,
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(4), // Padding around the text
                    decoration: BoxDecoration(
                      color: Colors.lightBlue, // Background color
                      borderRadius: BorderRadius.circular(8), // Rounded corners
                    ),
                    child: Text(
                      'Hotel Rekomendasi',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color:
                            Colors
                                .white, // Ensure text is readable on the background
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    hotel.title,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.orange),
                      Text(
                        ' ${hotel.rating.toStringAsFixed(1)} / 5 | ${hotel.address}',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  ),

                  SizedBox(height: 20),

                  // 2️⃣ Highlight Section
                  Text(
                    '✨ Recommended For',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      _highlightIcon(Icons.family_restroom, 'Family'),
                      SizedBox(width: 16), // Add spacing between items
                      _highlightIcon(Icons.business, 'Business'),
                      SizedBox(width: 16),
                      _highlightIcon(Icons.favorite, 'Romantic'),
                    ],
                  ),

                  SizedBox(height: 20),

                  // 3️⃣ Reviews Section (Placeholder)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '📝 Reviews',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),

                      // List of Reviews
                      Column(
                        children: List.generate(5, (index) {
                          return Card(
                            margin: EdgeInsets.symmetric(vertical: 6),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 3, // Shadow effect
                            child: Padding(
                              padding: EdgeInsets.all(12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '⭐ 4.${index + 5} / 5', // Mock Rating
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    '"Amazing experience! Will visit again!" - Guest ${index + 1}',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ],
                  ),

                  SizedBox(height: 20),

                  // 4️⃣ Facilities Section
                  Text(
                    '🏨 Facilities',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Wrap(
                    spacing: 10.0,
                    children:
                        hotel.facilities.map((facility) {
                          return Chip(
                            avatar: Icon(
                              Icons.check_circle,
                              color: Colors.green,
                            ),
                            label: Text(facility),
                          );
                        }).toList(),
                  ),
                  SizedBox(height: 20),

                  // 5️⃣ Location Section (Google Maps Preview)
                  Text(
                    '📍 Location',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.network(
                      'https://static.vecteezy.com/system/resources/previews/000/153/588/non_2x/vector-roadmap-location-map.jpg',
                      fit: BoxFit.cover,
                      errorBuilder:
                          (context, error, stackTrace) =>
                              Icon(Icons.map, size: 200, color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // ✅ Bottom Price & Checkout Bar
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Colors.grey.shade300)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  currencyFormatter.format(hotel.discountPrice),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                if (hotel.discount > 0)
                  Text(
                    currencyFormatter.format(hotel.price),
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement checkout action
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                backgroundColor: Colors.blue,
              ),
              child: Text(
                'Checkout',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 Helper function for icons in highlights
  Widget _highlightIcon(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, size: 32, color: Colors.blue),
        SizedBox(height: 5),
        Text(label, style: TextStyle(fontSize: 14)),
      ],
    );
  }
}
