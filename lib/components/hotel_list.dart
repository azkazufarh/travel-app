import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myapp/core/models/hotel.dart';
import 'package:myapp/screens/hotel_detail_page.dart';

class HotelList extends StatelessWidget {
  final List<Hotel> hotels;

  const HotelList({Key? key, required this.hotels}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currencyFormatter =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);

    return Column(
      children: hotels.map((hotel) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HotelDetailPage(hotel: hotel),
              ),
            );
          },
          child: Card(
            margin: EdgeInsets.all(8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      hotel.images[Random().nextInt(hotel.images.length.clamp(1, 5))],
                      height: 150,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          Icon(Icons.broken_image, size: 150),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(hotel.title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                   Row(
                              children: [
                                Text(
                                  currencyFormatter.format(hotel.discountPrice),
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                  ),
                                ),
                                SizedBox(width: 8),
                                if (hotel.discount > 0)
                                  Text(
                                    currencyFormatter.format(hotel.price),
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                Spacer(),
                                if (hotel.discount > 0)
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Text(
                                      '${hotel.discount}% OFF',
                                      style: TextStyle(color: Colors.white, fontSize: 12),
                                    ),
                                  ),
                              ],
                   )
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
