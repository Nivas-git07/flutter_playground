import 'package:flutter/material.dart';

Widget buildPromoBanner() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Container(
      width: double.infinity,
      height: 195,
      decoration: BoxDecoration(
        color: const Color(
          0xFFFFECEF,
        ), // Soft pastel peach tint background matching image_1e587b.jpg
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
        children: [
          // Left content column container block
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Big Sale",
                  style: TextStyle(
                    color: Color(
                      0xFFF97316,
                    ), // Vivid layout Orange accent color
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 4),
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      color: Color(
                        0xFF111827,
                      ), // Default deep graphite charcoal black for "Up to"
                      fontWeight: FontWeight.w900,
                      fontSize: 26,
                      height: 1.2,
                      fontFamily: '', // Inherit system/app font style safely
                    ),
                    children: [
                      const TextSpan(text: "Up to\n"),
                      TextSpan(
                        text: "60% OFF",
                        style: const TextStyle(
                          color: Color(
                            0xFFF97316,
                          ), // Vivid Orange color specifically for the discount text
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0F172A),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    // ⬇️ FIXED: Restricts button layout from expanding vertically past boundaries
                    minimumSize: const Size(100, 36),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 0,
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    "Get It Now",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Right-aligned promotional model image container setup
          Positioned(
            right: 12,
            bottom: 0,
            top: 0,
            child: Image.asset(
              'lib/assets/promo.png', // Add this asset to bundle or change path string
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) =>
                  const SizedBox(width: 140),
            ),
          ),
        ],
      ),
    ),
  );
}
