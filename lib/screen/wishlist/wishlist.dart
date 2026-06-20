import 'package:flutter/material.dart';
import "../../layout/appbar.dart";
import '../../layout/bottomnavigation.dart';
import "../../widgets/wishlistwidget/wishlistcard.dart";

class Wishlistscreen extends StatelessWidget {
  const Wishlistscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> wishlistItems = [
      {
        'title': 'Smart Watch Series 8',
        'subtitle': 'Black • 44mm',
        'price': '\$199.00',
        'oldPrice': '\$249.00',
        'status': 'In Stock',
        'statusColor': const Color(0xFF10B981),
        'statusBg': const Color(0xFFE6F4EA),
        'image': 'lib/assets/product1.png',
      },
      {
        'title': 'Wireless Headphones',
        'subtitle': 'White',
        'price': '\$129.00',
        'oldPrice': '\$159.00',
        'status': 'In Stock',
        'statusColor': const Color(0xFF10B981),
        'statusBg': const Color(0xFFE6F4EA),
        'image': 'lib/assets/product5.png',
      },
      {
        'title': 'Minimalist Backpack',
        'subtitle': 'Beige',
        'price': '\$79.00',
        'oldPrice': '\$99.00',
        'status': 'In Stock',
        'statusColor': const Color(0xFF10B981),
        'statusBg': const Color(0xFFE6F4EA),
        'image': 'lib/assets/product3.png',
      },
      {
        'title': 'Running Shoes',
        'subtitle': 'White • 42',
        'price': '\$89.00',
        'oldPrice': '\$119.00',
        'status': 'Low Stock',
        'statusColor': const Color(0xFFF59E0B),
        'statusBg': const Color(0xFFFEF3C7),
        'image': 'lib/assets/product4.png',
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFB),
      appBar: appbarnavigation(context, 'Wishlist'),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                // ⚡ INCREASED COUNT BY 2: 1 for the scrollable header, 1 for the scrollable bottom banner
                itemCount: wishlistItems.length + 2,
                itemBuilder: (context, index) {
                  
                  // 1️⃣ ITEM 0: The Scrollable "My Wishlist" Summary Header
                  if (index == 0) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                              color: Color(0xFFFFF1F2),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.favorite,
                              color: Color(0xFFF43F5E),
                              size: 24,
                            ),
                          ),
                          const SizedBox(width: 14),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "My Wishlist",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF111827),
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                "12 items",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Color(0xFF9CA3AF),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          OutlinedButton.icon(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.edit_outlined,
                              size: 14,
                              color: Color(0xFF6B7280),
                            ),
                            label: const Text(
                              "Manage",
                              style: TextStyle(
                                color: Color(0xFF1F2937),
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.grey.shade200),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 8,
                      ),
                    ),
                  ),
                ],
              ),
                    );
                  }

                  // 2️⃣ LAST ITEM: The Scrollable Promo Banner
                  if (index == wishlistItems.length + 1) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 24.0),
                      child: _buildBottomPromoBanner(),
                    );
                  }

                  // 3️⃣ MIDDLE ITEMS: The actual wishlist cards
                  // We subtract 1 from the index because index 0 is taken by the header
                  final item = wishlistItems[index - 1];
                  return buildWishlistCard(item);
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: bottomNaigation(context, 2),
    );
  }

  Widget _buildBottomPromoBanner() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFAF2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFFEF3C7),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(Icons.shopping_bag, color: Color(0xFFD97706), size: 22),
          ),
          const SizedBox(width: 14),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Move items to bag",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFF1F2937)),
                ),
                SizedBox(height: 2),
                Text(
                  "Add items to your bag and place your order now.",
                  style: TextStyle(color: Color(0xFF6B7280), fontSize: 12, height: 1.3),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0F172A),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              elevation: 0,
            ),
            child: const Text(
              "Shop Now",
              style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}