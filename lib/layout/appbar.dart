import 'package:flutter/material.dart';
import '../screen/notification/notification.dart';

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
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),
    centerTitle: true,
    actions: [
      // 🛒 Cart Button with Native Badge
      Badge(
        label: const Text('3', style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFFEF4444),
        offset: const Offset(-4, 4),
        child: IconButton(
          onPressed: () {
            print("Cart clicked");
          },
          icon: const Icon(Icons.shopping_cart_outlined, color: Colors.black),
        ),
      ),
      const SizedBox(width: 4),

      // 🔔 Notification Button with Native Badge
      Badge(
        label: const Text('5', style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFFEF4444),
        offset: const Offset(-4, 4),
        child: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Notificationscreen()),
            );
          },
          icon: const Icon(Icons.notifications_none_outlined, color: Colors.black),
        ),
      ),
      const SizedBox(width: 12),
    ],
  );
}