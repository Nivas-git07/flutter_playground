import 'package:flutter/material.dart';
import "../../layout/appbar.dart";
import '../../layout/bottomnavigation.dart';

class Notificationscreen extends StatelessWidget {
  const Notificationscreen({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final List<Map<String, dynamic>> todayNotifications = [
      {
        'title': 'Order Delivered',
        'desc': 'Your order #ORD12345 has been delivered successfully.',
        'time': '10:30 AM',
        'icon': Icons.shopping_bag_outlined,
        'color': const Color(0xFF8B5CF6), // Purple
        'bg': const Color(0xFFF5F3FF),
        'unread': true,
      },
      {
        'title': 'Flash Sale is Live!',
        'desc': 'Up to 60% OFF on top products.\nHurry! Limited time only.',
        'time': '09:15 AM',
        'icon': Icons.local_offer_outlined,
        'color': const Color(0xFFF97316), // Orange
        'bg': const Color(0xFFFFF7ED),
        'unread': true,
      },
      {
        'title': 'Order Shipped',
        'desc': 'Your order #ORD12345 has been shipped.\nTrack your order now.',
        'time': '08:45 AM',
        'icon': Icons.local_shipping_outlined,
        'color': const Color(0xFF10B981), // Green
        'bg': const Color(0xFFE6F4EA),
        'unread': false,
      },
    ];
    final List<Map<String, dynamic>> yesterdayNotifications = [
      {
        'title': 'Wishlist Update',
        'desc': 'The price of an item in your wishlist\nhas dropped!',
        'time': 'Yesterday, 07:20 PM',
        'icon': Icons.favorite_border,
        'color': const Color(0xFFEF4444), // Red
        'bg': const Color(0xFFFFF1F2),
        'unread': false,
      },
      {
        'title': 'Payment Successful',
        'desc':
            'Your payment of \$119.00 was successful.\nThank you for shopping with us!',
        'time': 'Yesterday, 04:35 PM',
        'icon': Icons.account_balance_wallet_outlined,
        'color': const Color(0xFF3B82F6), // Blue
        'bg': const Color(0xFFEFF6FF),
        'unread': false,
      },
      {
        'title': 'Special Offer Just for You',
        'desc': 'Enjoy 15% OFF on your next purchase.\nUse code: SAVE15',
        'time': 'Yesterday, 11:50 AM',
        'icon': Icons.card_giftcard_outlined,
        'color': const Color(0xFFF59E0B), // Gold/Amber
        'bg': const Color(0xFFFEF3C7),
        'unread': false,
      },
    ];
    final List<Map<String, dynamic>> earlierNotifications = [
      {
        'title': 'New Arrivals',
        'desc': 'Check out the latest products\nnow available in our store.',
        'time': 'May 18, 09:30 AM',
        'icon': Icons.notifications_none_outlined,
        'color': const Color(0xFF0D9488), // Teal
        'bg': const Color(0xFFF0FDFA),
        'unread': false,
      },
    ];
    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFB),
      appBar: appbarnavigation(context, "Notification"),
      body: SafeArea(
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: 12,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: _buildPermissionBanner(),
              );
            }
            if (index == 1) {
              return _buildsectionHeader("Today");
            }
            if(index >= 2 && index<=4){
              return _buildNotificationcard(todayNotifications[index - 2]);
            }

            if (index == 5){ return _buildsectionHeader("Yesterday");}

            if (index >= 6 && index <= 8) {
              return _buildNotificationcard(yesterdayNotifications[index - 6]);
            }
            if (index == 9) return _buildsectionHeader("Earlier");

            if (index == 10) {
              return _buildNotificationcard(earlierNotifications[0]);
            }

            if (index == 11) {
              return Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 24.0),
                child: _buildMarkAllReadButton(),
              );
            }

            return const SizedBox.shrink();

          },
        ),
      ),

      bottomNavigationBar: bottomNaigation(context, 1),
    );
  }
}

Widget _buildPermissionBanner() {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: const Color(0xFFF5F3FF), // Soft lilac background fill tint
      borderRadius: BorderRadius.circular(16),
    ),
    child: Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.notifications_active,
            color: Color(0xFF7C3AED),
            size: 22,
          ),
        ),
        const SizedBox(width: 14),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Turn on Push Notifications",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Color(0xFF1F2937),
                ),
              ),
              SizedBox(height: 3),
              Text(
                "Get real-time updates about orders and offers",
                style: TextStyle(color: Color(0xFF6B7280), fontSize: 12),
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF7C3AED), // Premium purple button
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            elevation: 0,
          ),
          child: const Text(
            "Enable",
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _buildsectionHeader(String title) {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0, bottom: 12.0),
    child: Text(
      title,
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: Color(0xFF1F2937),
      ),
    ),
  );
}

Widget _buildNotificationcard(Map<String, dynamic> data) {
  return Container(
    margin: const EdgeInsets.only(bottom: 12),
    padding: const EdgeInsets.all(14),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: const Color(0xFFF3F4F6)),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(color: data['bg'], shape: BoxShape.circle),
          child: Icon(data['icon'], color: data['color'], size: 20),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      data['title'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Color(0xFF111827),
                      ),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    data['time'],
                    style: const TextStyle(
                      color: Color(0xFF9CA3AF),
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                data['desc'],
                style: const TextStyle(
                  color: Color(0xFF6B7280),
                  fontSize: 12,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
        if (data['unread']) ...[
          const SizedBox(width: 8),
          Padding(
            padding: const EdgeInsets.only(top: 6.0),
            child: Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: Color(
                  0xFF7C3AED,
                ), // Unread dot color matching design system
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ],
    ),
  );
}

Widget _buildMarkAllReadButton() {
    return Container(
      width: double.infinity,
      height: 52,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF3F4F6)),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.done_all, color: Color(0xFF1F2937), size: 18),
              SizedBox(width: 8),
              Text(
                "Mark all as read",
                style: TextStyle(
                  color: Color(0xFF1F2937),
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  