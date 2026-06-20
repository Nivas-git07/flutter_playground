import 'package:flutter/material.dart';

PreferredSizeWidget appbarnavigation(BuildContext context, String titletext) {
  return AppBar(
    backgroundColor: const Color(0xFFFBFBFB),
    elevation: 0,
    leading: IconButton(
      onPressed: () => Navigator.maybePop(context),
      icon: const Icon(Icons.arrow_back, color: Colors.black),
    ),
    title: Text(
      titletext,
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),
    centerTitle: true,
    actions: [
      _buildNotificationBadge(Icons.shopping_cart_outlined, '3'),
      const SizedBox(width: 12),
      _buildNotificationBadge(Icons.notifications_none_outlined, '5'),
      const SizedBox(width: 16),
    ],
  );
}

Widget _buildNotificationBadge(IconData icon, String count) {
  return Stack(
    alignment: Alignment.center,
    children: [
      Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(color: const Color(0xFFF3F4F6)),
        ),
        child: Icon(icon, color: Colors.black, size: 20),
      ),
      Positioned(
        top: 2,
        right: 2,
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
  );
}
