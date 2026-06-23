import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../widgets/homewidget/brandwidget.dart';
import "../../widgets/homewidget/recommentation.dart";
import "../../layout/bottomnavigation.dart";
import "../../screen/flashsale/flashsale.dart";

final List<Map<String, dynamic>> recommendedProducts = [
  {
    'title': 'Phone 12',
    'price': '\$799.00',
    'oldprice': '\$999.00',
    'rating': '4.9',
    'imagePath': 'lib/assets/product2.png',
    'cardbg': const Color(0xFFEEF2FF),
  },
  {
    'title': 'serum',
    'price': '\$49.00',
    'oldprice': '\$999.00',
    'rating': '4.8',
    'imagePath': 'lib/assets/product4.png',
    'cardbg': const Color.fromARGB(255, 234, 159, 84),
  },
  {
    'title': 'Watch',
    'price': '\$149.00',
    'oldprice': '\$999.00',
    'rating': '4.5',
    'imagePath': 'lib/assets/product3.png',
    'cardbg': const Color.fromARGB(255, 224, 225, 227),
  },
  {
    'title': 'Hoodie For Men',
    'price': '\$19.00',
    'oldprice': '\$39.00',
    'rating': '4.7',
    'imagePath': 'lib/assets/product1.png',
    'cardbg': const Color(0xFFFFF1F2),
  },
  {
    'title': 'Mechnical Keyboard',
    'price': '\$130.00',
    'oldprice': '\$39.00',
    'rating': '4.2',
    'imagePath': 'lib/assets/product5.png',
    'cardbg': const Color(0xFFFFF1F2),
  },
  {
    'title': 'Nike show',
    'price': '\$449.00',
    'oldprice': '\$39.00',
    'rating': '4.3',
    'imagePath': 'lib/assets/product6.png',
    'cardbg': const Color(0xFFFFF1F2),
  },
];

class ShopHome extends StatelessWidget {
  const ShopHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFB),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(
          70.0,
        ), // Customize height as needed
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "The goat fashion",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    letterSpacing: -0.5,
                  ),
                ),
                Row(
                  children: [
                    _buildNotificationBadge(Icons.shopping_cart_outlined, '3'),
                    const SizedBox(width: 12),
                    _buildNotificationBadge(
                      Icons.notifications_none_outlined,
                      '5',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  height: 52,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF3F4F6),
                    borderRadius: BorderRadius.circular(26),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: "search for products...",
                      hintStyle: TextStyle(
                        color: Color(0xFF9CA3AF),
                        fontSize: 15,
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Color(0xFF6B7280),
                        size: 22,
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 15),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              _buildSectionHeader('Categories', () {}),
              const SizedBox(height: 16),
              SizedBox(
                height: 115,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    _buildCategoryCircle(
                      'Fashion',
                      Icons.checkroom,
                      const Color(0xFFE0F2FE),
                    ),
                    _buildCategoryCircle(
                      'Electronics',
                      Icons.phone_iphone,
                      const Color(0xFFE0E7FF),
                    ),
                    _buildCategoryCircle(
                      'Sports',
                      Icons.sports_basketball,
                      const Color(0xFFFFEDD5),
                    ),
                    _buildCategoryCircle(
                      'Furniture',
                      Icons.chair,
                      const Color(0xFFFEF3C7),
                    ),
                    _buildCategoryCircle(
                      'Beauty',
                      Icons.face,
                      const Color(0xFFFCE7F3),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              Padding(
                padding: const EdgeInsetsGeometry.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    const Text(
                      "Flash Sale",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            color: Colors.amber,
                            size: 14,
                          ),
                          SizedBox(width: 4),
                          Text(
                            "03 : 25 : 45",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FlashSaleScreen(),
                          ),
                        );
                      },
                      child: const Row(
                        children: [
                          Text(
                            'See All ',
                            style: TextStyle(
                              color: Color(0xFF9CA3AF),
                              fontSize: 14,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 12,
                            color: Color(0xFF9CA3AF),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: _buildProductCard(
                        title: 'Hoodie For Men',
                        price: '\$19.00',
                        oldprice: '\$39.00',
                        discount: '-40%',
                        imagePath: 'lib/assets/product1.png',
                        cardbg: const Color(0xFFFFF1F2),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildProductCard(
                        title: 'Phone 12',
                        price: '\$799.00',
                        oldprice: '\$999.00',
                        discount: '-15%',
                        imagePath: 'lib/assets/product2.png',
                        cardbg: const Color(0xFFEEF2FF),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  width: double.infinity,
                  height: 120,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFFFEF3C7), Color(0xFFFEE2E2)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Fall Color Mode",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w900,
                                color: Color(0xFF1F2937),
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              "Sale is live now",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.orange[800],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        right: -10,
                        bottom: 0,
                        top: 10,

                        child: Image.asset(
                          'lib/assets/sale.png',
                          width: 140,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              buildtopbrandsection(),
              const SizedBox(height: 16),

              buildrecommendationsection(recommendedProducts),

              // 2. Recommended Grid Section Injection

              // 💡 IMPORTANT: Spacing fix allocation prevents navigation overlap crashing!
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
      bottomNavigationBar: bottomNaigation(context, 0),
    );
  }

  Widget _buildSectionHeader(String title, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: const Row(
              children: [
                Text(
                  'See All ',
                  style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 14),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: Color(0xFF9CA3AF),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationBadge(IconData icon, String count) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Icon(icon, color: Colors.black, size: 22),
          Positioned(
            top: 6,
            right: 6,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: Color(0xFFEF4444),
                shape: BoxShape.circle,
              ),
              child: Text(
                count,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 8,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildCategoryCircle(String label, IconData icon, Color color) {
  return Padding(
    padding: const EdgeInsets.only(right: 18.0),
    child: Column(
      children: [
        Container(
          width: 68,
          height: 68,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          child: Icon(icon, color: Colors.black87, size: 28),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: Color(0xFF374151),
          ),
        ),
      ],
    ),
  );
}

Widget _buildProductCard({
  required String title,
  required String price,
  required String oldprice,
  required String discount,
  required String imagePath,
  required Color cardbg,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        height: 190,
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

            Positioned(
              top: 12,
              left: 12,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                decoration: BoxDecoration(
                  color: const Color(0xFFF97316),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  discount,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
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
      const SizedBox(height: 10),
      Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 15,
          color: Color(0xFF1F2937),
        ),
      ),
      const SizedBox(height: 4),
      Row(
        children: [
          Text(
            price,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w900,
              fontSize: 15,
            ),
          ),
          const SizedBox(width: 6),
          Text(
            oldprice,
            style: const TextStyle(
              color: Color(0xFF9CA3AF),
              decoration: TextDecoration.lineThrough,
              fontSize: 12,
            ),
          ),
        ],
      ),
    ],
  );
}
