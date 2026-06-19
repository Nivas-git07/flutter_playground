import 'package:flutter/material.dart';

Widget buildrecommendationsection(List<Map<String, dynamic>> products) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
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
      // Two-Column Grid mapping over your products list array
      GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(), // Managed by outer SingleChildScrollView
        padding: const EdgeInsets.symmetric(horizontal: 16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,          // 2 items per row
          crossAxisSpacing: 16,       // Horizontal spacing
          mainAxisSpacing: 16,        // Vertical spacing
          childAspectRatio: 0.68,     // Safe dimension scale ratio preventing text cutoff
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return recommendationCard(
            title: product['title'] ?? '',
            price: product['price'] ?? '',
            oldprice: product['oldprice'] ?? '',
            rating: product['rating'] ?? '0.0',
            imagePath: product['imagePath'] ?? '',
            cardbg: product['cardbg'] ?? Colors.transparent,
          );
        },
      ),
    ],
  );
}
Widget recommendationCard({
  required String title,
  required String price,
  required String oldprice, // Kept in signature so home.dart doesn't break, but ignored inside
  required String rating,
  required String imagePath,
  required Color cardbg,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded( 
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: cardbg,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(imagePath, fit: BoxFit.cover),
                ),
              ),
              const Positioned(
                top: 12,
                right: 12,
                child: Icon(
                  Icons.favorite_border,
                  color: Color(0xFF9CA3AF),
                  size: 22,
                ),
              ),
            ],
          ),
        ),
      ),
      const SizedBox(height: 10),
      Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 15,
          color: Color(0xFF1F2937),
        ),
      ),
      const SizedBox(height: 4),
      
      // Fixed layout row: Price on Left, Rating Row on Right
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Pushes elements to opposite sides
        children: [
          // Left Side: Current Price only
          Text(
            price,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w900,
              fontSize: 15,
            ),
          ),
          
          // Right Side: Star Badge
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.star, color: Colors.amber, size: 16),
              const SizedBox(width: 4),
              Text(
                rating,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey, // Grey typography matching your image mockup
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}