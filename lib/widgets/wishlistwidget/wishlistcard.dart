import 'package:flutter/material.dart';

Widget buildWishlistCard(Map<String, dynamic> item) {
  return Container(
    margin: const EdgeInsets.only(bottom: 16),
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: const Color(0xFFF3F4F6)),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left Side: Product thumbnail preview block
        Container(
          width: 95,
          height: 95,
          decoration: BoxDecoration(
            // ⚡ FIXED: Matches the base container color instead of using an off-white fill
            color: Colors.transparent, 
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFF9FAFB)), // Soft, seamless frame outline
          ),
          padding: const EdgeInsets.all(8),
          child: Image.asset(
            item['image'],
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) => const Icon(Icons.image, color: Colors.grey),
          ),
        ),
        const SizedBox(width: 14),

        // Center/Right Content Stack Area
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['title'],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color(0xFF1F2937)),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          item['subtitle'],
                          style: const TextStyle(color: Color(0xFF9CA3AF), fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  // Heart element interaction badge
                  Container(
                    width: 28,
                    height: 28,
                    decoration: const BoxDecoration(color: Color(0xFFFFF1F2), shape: BoxShape.circle),
                    child: const Icon(Icons.favorite, color: Color(0xFFEF4444), size: 14),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              // Prices Row
              Row(
                children: [
                  Text(
                    item['price'],
                    style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 15, color: Colors.black),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    item['oldPrice'],
                    style: const TextStyle(color: Color(0xFF9CA3AF), decoration: TextDecoration.lineThrough, fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              // Status Badge Row + Add to Bag Button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      // color: item['statusBg'],
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      item['status'],
                      style: TextStyle(color: item['statusColor'], fontSize: 11, fontWeight: FontWeight.bold),
                    ),
                  ),
                  // Trash Delete Icon + Add to Bag button action pair
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.delete_outline, color: Color(0xFF9CA3AF), size: 20),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        onPressed: () {},
                      ),
                      const SizedBox(width: 14),
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.shopping_bag_outlined, size: 14, color: Colors.white),
                        label: const Text("Add to Bag", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF0F172A),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                          minimumSize: const Size(100, 34),
                          elevation: 0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}