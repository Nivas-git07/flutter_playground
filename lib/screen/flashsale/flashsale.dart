import 'package:flutter/material.dart';
import "../../layout/appbar.dart"; // Using your appbar reference template
import "../../layout/bottomnavigation.dart";
class FlashSaleScreen extends StatelessWidget {
  const FlashSaleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Categories data for horizontal scroll chip bar
    final List<String> categories = [
      'All', 'Electronics', "Men's Fashion", "Women's Fashion", 'Home', 'Beauty'
    ];

    // Product dataset matching the image layout specs
    final List<Map<String, dynamic>> flashSaleProducts = [
      {
        'title': "Hoodie Women's",
        'subtitle': 'Pink • M',
        'price': '\$19.99',
        'oldPrice': '\$39.99',
        'discount': '-50%',
        'soldCount': 120,
        'totalStock': 250,
        'image': 'lib/assets/product1.png',
      },
      {
        'title': 'Smart Watch S7',
        'subtitle': 'Gold',
        'price': '\$119.00',
        'oldPrice': '\$199.00',
        'discount': '-40%',
        'soldCount': 80,
        'totalStock': 150,
        'image': 'lib/assets/product5.png',
      },
      {
        'title': 'Wireless Speaker',
        'subtitle': 'Black',
        'price': '\$27.99',
        'oldPrice': '\$39.99',
        'discount': '-30%',
        'soldCount': 60,
        'totalStock': 120,
        'image': 'lib/assets/product3.png',
      },
      {
        'title': 'Sneakers For Men',
        'subtitle': 'White • 42',
        'price': '\$39.99',
        'oldPrice': '\$72.99',
        'discount': '-45%',
        'soldCount': 150,
        'totalStock': 300,
        'image': 'lib/assets/product4.png',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white, // Pure white background setup
      appBar: appbarnavigation(context, 'Flash Sale'),
      body: SafeArea(
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          // Total items = 1 (Banner) + 1 (Ends In Countdown) + 1 (Horizontal Chips) + Products + 1 (Bottom Info Bar)
          itemCount: 4 + flashSaleProducts.length,
          itemBuilder: (context, index) {
            // 1️⃣ Top Purple Hero Shoe Banner
            if (index == 0) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: _buildHeroFlashBanner(),
              );
            }

            // 2️⃣ "Ends In" Segment Row with Block Timers
            if (index == 1) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: _buildCountdownHeader(),
              );
            }

            // 3️⃣ Horizontal Categorization Scroll View Box
            if (index == 2) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: _buildHorizontalCategoryChips(categories),
              );
            }

            // 4️⃣ Bottom Info Block Banner (Placed at the very end of the list)
            if (index == flashSaleProducts.length + 3) {
              return Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 24.0),
                child: _buildBottomPromoBanner(),
              );
            }

            // 5️⃣ Core Product Items Rows (Index calculations offset by 3)
            final product = flashSaleProducts[index - 3];
            return _buildFlashProductCard(product);
          },
        ),
      ),
      bottomNavigationBar: bottomNaigation(context, 1),
    );
  }

  // --- SUB-WIDGET COMPONENT DESIGN BLOCKS ---

  Widget _buildHeroFlashBanner() {
    return Container(
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        color: const Color(0xFFF5F3FF), // Soft lavender tint glow
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Flash Sale",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900, color: Color(0xFF111827)),
                ),
                const SizedBox(height: 4),
                const Text(
                  "Up to 60% OFF",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF7C3AED)),
                ),
                const SizedBox(height: 16),
                // Digital Mini Timer Widget capsule
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.alarm, size: 14, color: Colors.black87),
                      SizedBox(width: 6),
                      Text(
                        "02 : 18 : 45",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.black87),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Hurry! Limited time deals",
                  style: TextStyle(fontSize: 11, color: Color(0xFF6B7280), fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Positioned(
            right: 2,
            bottom: 12,
            top: 12,
            child: Image.asset(
              'lib/assets/product8.png', // Add shoe asset here
              width: 180,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) => const SizedBox(width: 140),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCountdownHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Ends In",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF111827)),
        ),
        Row(
          children: [
            _buildTimerBox("02", "Days"),
            _buildTimerBox("18", "Hours"),
            _buildTimerBox("45", "Mins"),
            _buildTimerBox("25", "Secs"),
          ],
        ),
      ],
    );
  }

  Widget _buildTimerBox(String digit, String unit) {
    return Container(
      margin: const EdgeInsets.only(left: 4),
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFF0F172A), // Charcoal black time layout block
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        children: [
          Text(digit, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 11)),
          Text(unit, style: const TextStyle(color: Color(0xFF9CA3AF), fontSize: 7, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  Widget _buildHorizontalCategoryChips(List<String> categories) {
    return SizedBox(
      height: 38,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final isSelected = index == 0; // "All" chip highlights active state setup
          return Container(
            margin: const EdgeInsets.only(right: 8),
            child: FilterChip(
              label: Text(categories[index]),
              selected: isSelected,
              onSelected: (val) {},
              selectedColor: const Color(0xFF7C3AED), // Premium purple filter tint
              labelStyle: TextStyle(
                color: isSelected ? Colors.white : const Color(0xFF4B5563),
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                fontSize: 13,
              ),
              backgroundColor: const Color(0xFFF3F4F6),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              side: BorderSide.none,
              showCheckmark: false,
            ),
          );
        },
      ),
    );
  }

  Widget _buildFlashProductCard(Map<String, dynamic> product) {
    double progressRatio = product['soldCount'] / product['totalStock'];

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFF9FAFB)),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.015), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left Side: Image container layout holding discount tag badge overlay elements
          Stack(
            children: [
              Container(
                width: 95,
                height: 95,
                decoration: BoxDecoration(
                  color: const Color(0xFFFBFBFB),
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(6),
                child: Image.asset(
                  product['image'],
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) => const Icon(Icons.image, color: Colors.grey),
                ),
              ),
              Positioned(
                top: 4,
                left: 4,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF97316), // Vivid Orange tag
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    product['discount'],
                    style: const TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 14),

          // Right Side: Details Core Column Info block data
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product['title'],
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color(0xFF1F2937)),
                ),
                const SizedBox(height: 2),
                Text(product['subtitle'], style: const TextStyle(color: Color(0xFF9CA3AF), fontSize: 12)),
                const SizedBox(height: 8),
                
                // Price Matrix Row + Dynamic Action Buy Button Structure
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(product['price'], style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 16, color: Color(0xFFF97316))),
                            const SizedBox(width: 6),
                            Text(product['oldPrice'], style: const TextStyle(color: Color(0xFF9CA3AF), decoration: TextDecoration.lineThrough, fontSize: 12)),
                          ],
                        ),
                        const SizedBox(height: 8),
                        
                        // Linear Progression Stock Counter Frame Block
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: SizedBox(
                                width: 85,
                                height: 8,
                                child: LinearProgressIndicator(
                                  value: progressRatio,
                                  backgroundColor: const Color(0xFFE5E7EB),
                                  valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF0F172A)),
                                ),
                              ),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              "${product['soldCount']} sold",
                              style: const TextStyle(fontSize: 10, color: Color(0xFF6B7280), fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                    
                    // Call to Action execution button
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.shopping_bag_outlined, size: 14, color: Colors.white),
                      label: const Text("Buy Now", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0F172A),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                        minimumSize: const Size(100, 36),
                        elevation: 0,
                      ),
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

  Widget _buildBottomPromoBanner() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F3FF), // Soft purple glow tint matches layout theme baseline
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(color: Color(0xFF8B5CF6), shape: BoxShape.circle),
            child: const Icon(Icons.local_offer_outlined, color: Colors.white, size: 18),
          ),
          const SizedBox(width: 14),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Why shop Flash Sale?",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFF1F2937)),
                ),
                SizedBox(height: 2),
                Text(
                  "Limited time offers • Best prices • Limited stock",
                  style: TextStyle(color: Color(0xFF6B7280), fontSize: 11, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          const SizedBox(width: 4),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Color(0xFFC4B5FD)),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
            child: const Text(
              "Shop More Deals",
              style: TextStyle(color: Color(0xFF7C3AED), fontSize: 11, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}