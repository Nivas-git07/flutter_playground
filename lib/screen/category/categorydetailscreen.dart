import 'package:flutter/material.dart';
import "../../layout/appbar.dart";
import '../../layout/bottomnavigation.dart';

class CategoryDetailScreen extends StatelessWidget {
  const CategoryDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. Top Sub-categories list data
    final List<Map<String, dynamic>> subCategories = [
      {'name': 'Fashion', 'icon': Icons.checkroom, 'color': const Color(0xFF7C3AED), 'bg': const Color(0xFFF5F3FF), 'selected': true},
      {'name': 'Electronics', 'icon': Icons.smartphone, 'color': const Color(0xFF1F2937), 'bg': const Color(0xFFF3F4F6), 'selected': false},
      {'name': 'Sports', 'icon': Icons.sports_basketball, 'color': const Color(0xFF1F2937), 'bg': const Color(0xFFF3F4F6), 'selected': false},
      {'name': 'Furniture', 'icon': Icons.chair, 'color': const Color(0xFF1F2937), 'bg': const Color(0xFFF3F4F6), 'selected': false},
      {'name': 'Beauty', 'icon': Icons.face, 'color': const Color(0xFF1F2937), 'bg': const Color(0xFFF3F4F6), 'selected': false},
      {'name': 'More', 'icon': Icons.grid_view, 'color': const Color(0xFF1F2937), 'bg': const Color(0xFFF3F4F6), 'selected': false},
    ];

    // 2. Product dataset matching grid cards layout specifications
    final List<Map<String, dynamic>> products = [
      {
        'title': 'Hoodie Sweatshirt',
        'subtitle': 'Women • Pink • M',
        'price': '\$19.99',
        'oldPrice': '\$32.99',
        'discount': '-40%',
        'rating': '4.5',
        'reviews': '120',
        'image': 'lib/assets/product1.png',
      },
      {
        'title': 'Denim Jacket',
        'subtitle': 'Women • Blue • M',
        'price': '\$39.99',
        'oldPrice': '\$56.99',
        'discount': '-30%',
        'rating': '4.7',
        'reviews': '98',
        'image': 'lib/assets/product2.png',
      },
      {
        'title': 'Knitted Sweater',
        'subtitle': 'Women • Beige • M',
        'price': '\$29.99',
        'oldPrice': '\$39.99',
        'discount': '-25%',
        'rating': '4.6',
        'reviews': '76',
        'image': 'lib/assets/product3.png',
      },
      {
        'title': 'Casual Sneakers',
        'subtitle': 'Women • White • 38',
        'price': '\$44.99',
        'oldPrice': '\$69.99',
        'discount': '-35%',
        'rating': '4.8',
        'reviews': '150',
        'image': 'lib/assets/product4.png',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appbarnavigation(context, 'Fashion'),
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            // ⚡ SLIVER 1: Horizontal Sub-categories List Block
            SliverToBoxAdapter(
              child: SizedBox(
                height: 110,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(left: 16, top: 12),
                  itemCount: subCategories.length,
                  itemBuilder: (context, index) {
                    final item = subCategories[index];
                    return _buildSubCategoryIcon(item);
                  },
                ),
              ),
            ),

            // ⚡ SLIVER 2: Promotional "Latest Fashion" Marketing Banner
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: _buildPromoHeroBanner(),
              ),
            ),

            // ⚡ SLIVER 3: "All Products" Filter & Utility Bar Controls Row
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
                child: _buildFilterUtilityBar(),
              ),
            ),

            // ⚡ SLIVER 4: The Responsive 2-Column Responsive Product Cards Grid
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverGrid.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.65, // Adjusts proportional card elongation ratio height
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return _buildProductGridCard(products[index]);
                },
              ),
            ),

            // ⚡ SLIVER 5: Bottom Secure Shopping Assurance Banner
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: _buildSecureShoppingBanner(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: bottomNaigation(context, 1), // Highlights "Categories" tab item index
    );
  }

  // --- SUB-WIDGET VISUAL BUILDING BLOCKS ---

  Widget _buildSubCategoryIcon(Map<String, dynamic> item) {
    return Padding(
      padding: const EdgeInsets.only(right: 18.0),
      child: Column(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: item['bg'],
              shape: BoxShape.circle,
              border: item['selected'] ? Border.all(color: const Color(0xFFC4B5FD), width: 1.5) : null,
            ),
            child: Icon(item['icon'], color: item['color'], size: 22),
          ),
          const SizedBox(height: 8),
          Text(
            item['name'],
            style: TextStyle(
              fontSize: 12,
              fontWeight: item['selected'] ? FontWeight.bold : FontWeight.w500,
              color: item['selected'] ? const Color(0xFF7C3AED) : const Color(0xFF6B7280),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPromoHeroBanner() {
    return Container(
      width: double.infinity,
      height: 140,
      decoration: BoxDecoration(
        color: const Color(0xFFF5F3FF),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Latest Fashion",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: Color(0xFF111827)),
                ),
                const SizedBox(height: 4),
                const Text(
                  "Explore our new collection\ntrending this season.",
                  style: TextStyle(fontSize: 12, color: Color(0xFF6B7280), height: 1.3),
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0F172A),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    elevation: 0,
                  ),
                  child: const Text("Shop Now", style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            top: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
              child: Image.asset(
                'lib/assets/fashion_banner.png', // Wardrobe/clothes asset
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) => const SizedBox(width: 120),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterUtilityBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "All Products",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF111827)),
        ),
        Row(
          children: [
            const Text("Sort by ", style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 13)),
            DropdownButton<String>(
              value: 'Popular',
              underline: const SizedBox(),
              icon: const Icon(Icons.keyboard_arrow_down, size: 16, color: Color(0xFF1F2937)),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Color(0xFF1F2937)),
              items: <String>['Popular', 'Newest', 'Price: Low-High'].map((String value) {
                return DropdownMenuItem<String>(value: value, child: Text(value));
              }).toList(),
              onChanged: (_) {},
            ),
            const SizedBox(width: 12),
            const Icon(Icons.tune_outlined, size: 16, color: Color(0xFF4B5563)),
            const Text(" Filter", style: TextStyle(color: Color(0xFF4B5563), fontSize: 13, fontWeight: FontWeight.w500)),
          ],
        ),
      ],
    );
  }

  Widget _buildProductGridCard(Map<String, dynamic> product) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF3F4F6)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Upper section: Product image display area with layer badges
          Expanded(
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFBFBFB),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: Image.asset(
                    product['image'],
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) => const Icon(Icons.image, color: Colors.grey),
                  ),
                ),
                // Discount Badge Text tag
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                    decoration: BoxDecoration(color: const Color(0xFFE0E7FF), borderRadius: BorderRadius.circular(6)),
                    child: Text(product['discount'], style: const TextStyle(color: Color(0xFF4338CA), fontSize: 9, fontWeight: FontWeight.bold)),
                  ),
                ),
                // Heart Toggle action element icon
                Positioned(
                  top: 8,
                  right: 8,
                  child: CircleAvatar(
                    radius: 14,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.favorite_border, color: Colors.grey.shade400, size: 14),
                  ),
                ),
              ],
            ),
          ),
          
          // Lower section: Comprehensive item description typography area
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product['title'],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Color(0xFF1F2937)),
                ),
                const SizedBox(height: 2),
                Text(product['subtitle'], style: const TextStyle(color: Color(0xFF9CA3AF), fontSize: 11)),
                const SizedBox(height: 6),
                // Pricing Layout Matrix + Compact Shopping Bag Button Action block
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(product['price'], style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 14, color: Color(0xFFF97316))),
                            const SizedBox(width: 4),
                            Text(product['oldPrice'], style: const TextStyle(color: Color(0xFF9CA3AF), decoration: TextDecoration.lineThrough, fontSize: 10)),
                          ],
                        ),
                        const SizedBox(height: 4),
                        // Star Rating Row Info summary
                        Row(
                          children: [
                            const Icon(Icons.star, color: Color(0xFFFBBF24), size: 12),
                            const SizedBox(width: 2),
                            Text(
                              "${product['rating']} (${product['reviews']})",
                              style: const TextStyle(color: Color(0xFF6B7280), fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                    // Quick-add to Bag Capsule button action
                    Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(color: const Color(0xFF0F172A), borderRadius: BorderRadius.circular(8)),
                      child: const Icon(Icons.shopping_bag_outlined, color: Colors.white, size: 14),
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

  Widget _buildSecureShoppingBanner() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF3F4F6)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(color: Color(0xFFEEF2F6), shape: BoxShape.circle),
            child: const Icon(Icons.lock_outline, color: Color(0xFF475569), size: 16),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Secure Shopping", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Color(0xFF334155))),
                SizedBox(height: 1),
                Text("100% secure payment & easy returns", style: TextStyle(color: Color(0xFF94A3B8), fontSize: 10)),
              ],
            ),
          ),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(padding: EdgeInsets.zero, minimumSize: Size.zero, tapTargetSize: MaterialTapTargetSize.shrinkWrap),
            child: Row(
              children: const [
                Text("Learn More ", style: TextStyle(color: Color(0xFF7C3AED), fontSize: 11, fontWeight: FontWeight.bold)),
                Icon(Icons.arrow_forward_ios, size: 9, color: Color(0xFF7C3AED)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}