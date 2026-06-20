import 'package:flutter/material.dart';
import "../../layout/appbar.dart";
import '../../layout/bottomnavigation.dart';

class Profilescreen extends StatelessWidget {
  const Profilescreen({super.key});
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> menuItems = [
      {
        'title': 'Personal Information',
        'subtitle': 'Update your personal details',
        'icon': Icons.person_outline,
        'iconColor': const Color(0xFF1F2937),
      },
      {
        'title': 'Address Book',
        'subtitle': 'Manage your saved addresses',
        'icon': Icons.location_on_outlined,
        'iconColor': const Color(0xFF1F2937),
      },
      {
        'title': 'Payment Methods',
        'subtitle': 'Manage your cards and wallets',
        'icon': Icons.credit_card_outlined,
        'iconColor': const Color(0xFF1F2937),
      },
      {
        'title': 'Wishlist',
        'subtitle': 'Your favorite items',
        'icon': Icons.favorite_border,
        'iconColor': const Color(0xFFEF4444),
      },
      {
        'title': 'Notifications',
        'subtitle': 'Manage notification preferences',
        'icon': Icons.notifications_none_outlined,
        'iconColor': const Color(0xFFD97706),
      },
      {
        'title': 'Privacy Policy',
        'subtitle': 'Read our privacy policy',
        'icon': Icons.shield_outlined,
        'iconColor': const Color(0xFF10B981),
      },
      {
        'title': 'Terms & Conditions',
        'subtitle': 'Read our terms and conditions',
        'icon': Icons.description_outlined,
        'iconColor': const Color(0xFF6366F1),
      },
    ];
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appbarnavigation(context, "profile"),
      body: SafeArea(
        
        child: ListView.builder(
          
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: 5,
          itemBuilder: (context, index) {
            switch (index) {
              case 0:
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: _buildProfileHeader(),
                );
              case 1:
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: _buildOrdersDashboard(),
                );
              case 2:
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: const Color(0xFFF3F4F6)),
                  ),
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: menuItems.length,
                    separatorBuilder: (context, i) => const Divider(
                      height: 1,
                      thickness: 1,
                      color: Color(0xFFF3F4F6),
                    ),
                    itemBuilder: (context, i) {
                      final item = menuItems[i];
                      return ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 4,
                        ),
                        leading: Icon(
                          item['icon'],
                          color: item['iconColor'],
                          size: 24,
                        ),
                        title: Text(
                          item['title'],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Color(0xFF111827),
                          ),
                        ),
                        subtitle: Text(
                          item['subtitle'],
                          style: const TextStyle(
                            color: Color(0xFF6B7280),
                            fontSize: 12,
                          ),
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          size: 14,
                          color: Color(0xFF9CA3AF),
                        ),
                        onTap: () {},
                      );
                    },
                  ),
                );
                case 3:
                // 🎧 SECTION 4: Contact Customer Support Block
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: _buildSupportCard(),
                );

                case 4:
                // 🎧 SECTION 4: Contact Customer Support Block
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: _buildLogoutButton(),
                );


            }
          },
        ),
      ),
      bottomNavigationBar: bottomNaigation(context, 4),
    );
  }
}

Widget _buildSupportCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFBF7), // Warm peach tint glow matching the bottom support box
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: const Color(0xFFFFEDD5), borderRadius: BorderRadius.circular(16)),
            child: const Icon(Icons.headset_mic_outlined, color: Color(0xFFEA580C), size: 24),
          ),
          const SizedBox(width: 14),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Need Help?", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color(0xFF1F2937))),
                SizedBox(height: 3),
                Text("We're here to help you with any questions or issues.", style: TextStyle(color: Color(0xFF6B7280), fontSize: 12, height: 1.3)),
              ],
            ),
          ),
          const SizedBox(width: 8),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.phone_in_talk_outlined, size: 14, color: Colors.white),
            label: const Text("Contact Support", style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0F172A),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
              elevation: 0,
            ),
          ),
        ],
      ),
    );
  }


Widget _buildProfileHeader() {
  return Row(
    children: [
      // Avatar stack with camera edit feature overlay
      Stack(
        children: [
          CircleAvatar(
            radius: 46,
            backgroundColor: const Color(0xFFFFF7ED),
            child: Icon(Icons.person, size: 54, color: Colors.orange.shade400),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: const Icon(
                Icons.camera_alt_outlined,
                size: 14,
                color: Color(0xFF1F2937),
              ),
            ),
          ),
        ],
      ),
      const SizedBox(width: 16),
      // User identity details
      const Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "John Doe",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w900,
                color: Color(0xFF111827),
              ),
            ),
            SizedBox(height: 4),
            Text(
              "john.doe@email.com",
              style: TextStyle(color: Color(0xFF6B7280), fontSize: 13),
            ),
            SizedBox(height: 2),
            Text(
              "+1 234 567 8900",
              style: TextStyle(color: Color(0xFF6B7280), fontSize: 13),
            ),
          ],
        ),
      ),
      // Edit button
      OutlinedButton.icon(
        onPressed: () {},
        icon: const Icon(
          Icons.edit_outlined,
          size: 14,
          color: Color(0xFF6B7280),
        ),
        label: const Text(
          "Edit Profile",
          style: TextStyle(
            color: Color(0xFF1F2937),
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: Colors.grey.shade200),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        ),
      ),
    ],
  );
}

Widget _buildOrdersDashboard() {
  final List<Map<String, dynamic>> orderStatuses = [
    {
      'label': 'Pending',
      'count': '2',
      'icon': Icons.inventory_2_outlined,
      'color': const Color(0xFFF97316),
      'bg': const Color(0xFFFFF7ED),
      'badge': true,
    },
    {
      'label': 'Shipped',
      'count': '1',
      'icon': Icons.local_shipping_outlined,
      'color': const Color(0xFF3B82F6),
      'bg': const Color(0xFFEFF6FF),
      'badge': false,
    },
    {
      'label': 'Delivered',
      'count': '5',
      'icon': Icons.assignment_turned_in_outlined,
      'color': const Color(0xFF10B981),
      'bg': const Color(0xFFE6F4EA),
      'badge': false,
    },
    {
      'label': 'Cancelled',
      'count': '0',
      'icon': Icons.assignment_return_outlined,
      'color': const Color(0xFF8B5CF6),
      'bg': const Color(0xFFF5F3FF),
      'badge': false,
    },
  ];

  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(24),
      border: Border.all(color: const Color(0xFFF3F4F6)),
    ),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "My Orders",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF111827),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Row(
                children: const [
                  Text(
                    "View All ",
                    style: TextStyle(
                      color: Color(0xFF9CA3AF),
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 11,
                    color: Color(0xFF9CA3AF),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 18),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: orderStatuses.map((status) {
            return Expanded(
              child: Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: status['bg'],
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Icon(
                          status['icon'],
                          color: status['color'],
                          size: 24,
                        ),
                      ),
                      if (status['badge'])
                        Positioned(
                          top: -6,
                          right: -6,
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: const BoxDecoration(
                              color: Color(0xFFF97316),
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              status['count'],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 9,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    status['label'],
                    style: const TextStyle(
                      color: Color(0xFF6B7280),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    status['count'],
                    style: const TextStyle(
                      color: Color(0xFF111827),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    ),
  );
}
Widget _buildLogoutButton() {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: double.infinity,
        height: 54,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFF3F4F6)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.logout, color: Color(0xFFEF4444), size: 18),
            SizedBox(width: 8),
            Text(
              "Logout",
              style: TextStyle(color: Color(0xFFEF4444), fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }