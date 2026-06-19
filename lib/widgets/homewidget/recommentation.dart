import 'package:flutter/material.dart';

Widget buildrecommendationsection() {
  final List<Map<String, dynamic>> items = [
    {
      'title': 'Apple Watch S7',
      'price': '\$399.00',
      'rating': '4.8',
      'image': 'lib/assets/watch.png',
      'bgColor': const Color(0xFFFFFBEB),
    },
    {
      'title': 'Foxtale Face Serum',
      'price': '\$24.99',
      'rating': '4.6',
      'image': 'lib/assets/serum.png',
      'bgColor': const Color(0xFFFFF7ED),
    },
  ];
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsetsGeometry.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Recommended For You',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            IconButton(
              icon: Icon(Icons.grid_view_rounded, color: Colors.grey.shade400),
              onPressed: () {},
            ),
          ],
        ),
      ),
    ],
  );
}
