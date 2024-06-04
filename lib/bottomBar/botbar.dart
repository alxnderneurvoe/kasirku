import 'package:flutter/material.dart';

import '../model/color.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const BottomNavBar(
      {super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: onTap,
        backgroundColor: bluebg,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(0.5),
        items: [
          _buildNavItem(Icons.home, 'Dashboard', 0),
          _buildNavItem(Icons.shopping_cart, 'Penjualan', 1),
          _buildNavItem(Icons.receipt_long, 'Pengeluaran', 2)
        ]);
  }

  BottomNavigationBarItem _buildNavItem(
    IconData icon,
    String label,
    int index,
  ) {
    return BottomNavigationBarItem(icon: Icon(icon), label: label);
  }
}
