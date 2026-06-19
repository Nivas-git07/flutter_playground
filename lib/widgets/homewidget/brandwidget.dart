import 'package:flutter/material.dart';

Widget buildtopbrandsection() {
  final List<Map<String, String>> brands = [
    {
      'name': 'Samsung',
      'discount': 'Upto 20% OFF',
      'logo': 'lib/assets/samsung.png',
    },
    {
      'name': 'Apple',
      'discount': 'Upto 20% OFF',
      'logo': 'lib/assets/apple.png',
    },
    {
      'name': 'Adidas',
      'discount': 'Upto 20% OFF',
      'logo': 'lib/assets/adidas.png',
    },
    {
      'name': 'Puma', 
      'discount': 'Upto 20% OFF', 
      'logo': 'lib/assets/puma.png'
    },
  ];
  
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Top Brands",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {},
              child: const Row(
                children: [
                  Text(
                    'See All ',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  Icon(Icons.arrow_forward_ios, size: 12, color: Colors.grey),
                ],
              ),
            ),
          ],
        ),
      ),
      // Fixed Container Height to comfortably fit the 75dp card + text labels
      SizedBox(
        height: 135, // ✅ Fixed: Increased from 30 to 135
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          itemCount: brands.length,
          itemBuilder: (context, index) {
            final brand = brands[index];
            return Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 75,
                    height: 75,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey.shade200),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Image.asset(
                      brand['logo']!,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.business, color: Colors.grey),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    brand['name']!,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    brand['discount']!,
                    style: const TextStyle(
                      color: Colors.orange,
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    ],
  );
}