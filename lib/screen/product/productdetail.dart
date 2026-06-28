import 'package:flutter/material.dart';


class ProductDetailsScreen extends StatefulWidget{
  const ProductDetailsScreen({super.key});
  @override
  State<StatefulWidget> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen>{
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
    {'title': 'Classic White Sneakers', 'brand': 'Nike', 'price': '\$44.99', 'oldPrice': '\$59.99', 'discount': '-25%', 'rating': '4.5', 'image': 'lib/assets/white_shoe.png'},
    {'title': 'Sporty Run Shoes', 'brand': 'Adidas', 'price': '\$48.99', 'oldPrice': '\$69.99', 'discount': '-30%', 'rating': '4.7', 'image': 'lib/assets/black_shoe.png'},
    {'title': 'Pink Comfort Sneakers', 'brand': 'Puma', 'price': '\$39.99', 'oldPrice': '\$49.99', 'discount': '-20%', 'rating': '4.4', 'image': 'lib/assets/pink_shoe.png'},
    {'title': 'Street Style Sneakers', 'brand': 'Reebok', 'price': '\$54.99', 'oldPrice': '\$64.99', 'discount': '-15%', 'rating': '4.6', 'image': 'lib/assets/grey_shoe.png'},
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

    );
  }
}