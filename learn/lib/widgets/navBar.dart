import 'package:flutter/material.dart';

class LearnNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;
  final List<Map<String, dynamic>> navItems;
  final Color? selectedItemColor;
  final Color? unselectedItemColor;
  
  LearnNavBar({
    required this.selectedIndex,
    required this.onItemTapped,
    required this.navItems,
    this.selectedItemColor,
    this.unselectedItemColor,
  });

  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> bottomNavBarItems = navItems.map((item) {
      return BottomNavigationBarItem(
        icon: Icon(item['icon'] as IconData),
        label: item['name'] as String,
        // You can also add 'activeIcon' property if needed
      );
    }).toList();

    return BottomNavigationBar(
      items: bottomNavBarItems,
      currentIndex: selectedIndex,
      onTap: onItemTapped,
      selectedItemColor: selectedItemColor ?? Theme.of(context).colorScheme.secondary,
      unselectedItemColor: unselectedItemColor ?? Colors.grey,
      type: BottomNavigationBarType.fixed,
      elevation: 0, // Customize or remove elevation
    );
  }
}
