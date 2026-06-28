import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});
  @override
  State<StatefulWidget> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int selectorColorIndex = 0;
  int selectedSizeIndex = 2;

  final List<Color> colors = [
    const Color(0xFF6366F1), // Purple
    const Color(0xFF1F2937), // Dark Grey/Black
    const Color(0xFFCBD5E1), // Light Grey
    const Color(0xFFF472B6), // Pink
  ];

  final List<String> sizes = ['5', '6', '7', '8', '9', '10', '11'];

  final List<Map<String, dynamic>> relatedProducts = [
    {
      'title': 'Classic White Sneakers',
      'brand': 'Nike',
      'price': '\$44.99',
      'oldPrice': '\$59.99',
      'discount': '-25%',
      'rating': '4.5',
      'image': 'lib/assets/white_shoe.png',
    },
    {
      'title': 'Sporty Run Shoes',
      'brand': 'Adidas',
      'price': '\$48.99',
      'oldPrice': '\$69.99',
      'discount': '-30%',
      'rating': '4.7',
      'image': 'lib/assets/black_shoe.png',
    },
    {
      'title': 'Pink Comfort Sneakers',
      'brand': 'Puma',
      'price': '\$39.99',
      'oldPrice': '\$49.99',
      'discount': '-20%',
      'rating': '4.4',
      'image': 'lib/assets/pink_shoe.png',
    },
    {
      'title': 'Street Style Sneakers',
      'brand': 'Reebok',
      'price': '\$54.99',
      'oldPrice': '\$64.99',
      'discount': '-15%',
      'rating': '4.6',
      'image': 'lib/assets/grey_shoe.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildproductimagesection(),
                    _buildProductThumbnailRow(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ⚡ MOVED INSIDE CLASS: Can now automatically access 'context'
  Widget _buildproductimagesection() {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 320,
          color: const Color(0xFFF9FAFB),
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Image.asset('lib/assets/product9.png', fit: BoxFit.contain),
        ),
        Positioned(
          top: 12,
          left: 12,
          right: 12,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildCircularActionButton(
                Icons.arrow_back,
                () => Navigator.pop(context), //  Works perfectly now!
              ),
              Row(
                children: [
                  _buildCircularActionButton(Icons.favorite_border, () {}),
                  const SizedBox(width: 10),
                  _buildCircularActionButton(Icons.share_outlined, () {}),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 16,
          right: 16,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text(
              "1 / 6",
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ⚡ MOVED INSIDE CLASS
  Widget _buildCircularActionButton(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      customBorder: const CircleBorder(),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(color: const Color(0xFFF3F4F6)),
        ),
        child: Icon(icon, color: const Color(0xFF1F2937), size: 20),
      ),
    );
  }
} // End of State class

Widget _buildProductThumbnailRow() {
  return Center(
    child: SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        itemCount: 5,
        itemBuilder: (context, index) {
          final isSelected = index == 0;
          return Container(
            width: 55,
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              color: const Color(0xFFF9FAFB),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: isSelected
                    ? const Color(0xFF7C3AED)
                    : const Color(0xFFE5E7EB),
                width: isSelected ? 1.5 : 1,
              ),
            ),
            padding: const EdgeInsets.all(4),
            child: Icon(
              Icons.image,
              size: 20,
              color: Colors.grey.shade400,
            ), // Alternate placeholder representation
          );
        },
      ),
    ),
  );
}

Widget _buildTitleandpricesection(){
  return Column(
crossAxisAlignment: CrossAxisAlignment.start,
  );
}