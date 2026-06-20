import 'package:flutter/material.dart';
import "../screen/home/home.dart";
import "../screen/category/category.dart";
import "../screen/myorder/order.dart";
import "../screen/profile/profile.dart";
import "../screen/wishlist/wishlist.dart";
Widget bottomNaigation(BuildContext context, int currentIndex) {
  return BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    backgroundColor: Colors.white,
    selectedItemColor: Colors.black,
    unselectedItemColor: const Color(0xFF9CA3AF),
    showSelectedLabels: true,
    showUnselectedLabels: true,
    selectedLabelStyle: const TextStyle(
      fontSize: 11,
      fontWeight: FontWeight.w600,
    ),
    unselectedLabelStyle: const TextStyle(
      fontSize: 11,
      fontWeight: FontWeight.w500,
    ),
    currentIndex: currentIndex,
    onTap: (index) {
      if (index == 0) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ShopHome()),
        );
      }
      ;
      if (index == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Categoryscreen()),
        );
      }
      ;
       if (index == 2) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Wishlistscreen()),
        );
      }
       if (index == 3) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const OrdersEmptyScreen()),
        );
      };
         if (index == 4) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Profilescreen()),
        );
      }
    },
    items: const [
      BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
      BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: "Categories"),
      BottomNavigationBarItem(
        icon: Icon(Icons.favorite_border),
        label: "wishlist",
      ),
      BottomNavigationBarItem(
        icon: Badge(label: Text('3'), child: Icon(Icons.shopping_bag_outlined)),
        label: 'Orders',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person_outline),
        label: 'Profile',
      ),
    ],
  );
}
