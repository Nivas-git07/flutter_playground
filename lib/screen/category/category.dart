import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../widgets/categorywidget/promobanner.dart';
import '../../widgets/categorywidget/categorycart.dart';
import '../../layout/bottomnavigation.dart';
import "../../layout/appbar.dart";
class Categoryscreen extends StatelessWidget {
  const Categoryscreen({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final List<Map<String, dynamic>> categories = [
      {
        'name': 'Apparel',
        'icon': Icons.checkroom,
        'color': const Color(0xFFE0F2FE),
      },
      {
        'name': 'Electronics',
        'icon': Icons.phone_iphone,
        'color': const Color(0xFFEEF2FF),
      },
      {
        'name': 'Furniture',
        'icon': Icons.chair,
        'color': const Color(0xFFFFEDD5),
      },
      {
        'name': 'Accessories',
        'icon': Icons.headphones,
        'color': const Color(0xFFE0F2FE),
      },
      {
        'name': 'Beauty',
        'icon': Icons.sanitizer,
        'color': const Color(0xFFFCE7F3),
      },
      {
        'name': 'Automotive',
        'icon': Icons.directions_car,
        'color': const Color(0xFFE0F2FE),
      },
      {
        'name': 'Gaming',
        'icon': Icons.sports_esports,
        'color': const Color(0xFFEEF2FF),
      },
      {
        'name': 'Health',
        'icon': Icons.fitness_center,
        'color': const Color(0xFFE0F2FE),
      },
      {
        'name': 'Books',
        'icon': Icons.menu_book,
        'color': const Color(0xFFFEF3C7),
      },
    ];
    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFB),
      appBar: appbarnavigation(context,"Categories"),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              buildPromoBanner(),

              const SizedBox(height: 16),

              const Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "Categories",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),

              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 14,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.82,
                  ),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    return buildCategoryCard(
                      name: category['name'],
                      icon: category['icon'],
                      circleColor: category['color'],
                    );
                  },
                ),
              ),
              const SizedBox(height: 26)
            ],
          ),
        ),
      ),
      bottomNavigationBar: bottomNaigation(context,1),
    );
  }
}
