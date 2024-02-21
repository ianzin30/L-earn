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
      );
    }).toList();

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(14)),
        boxShadow: [
          BoxShadow(
            color: Colors.black12, 
            spreadRadius: 0.0,
            blurRadius: 10.0,
            offset: Offset(0,-1),
          )
        ],
      ),
      margin: const EdgeInsets.all(10),
      child : ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(14)),
        child: BottomNavigationBar(
          items: bottomNavBarItems,
          currentIndex: selectedIndex,
          onTap: onItemTapped,
          selectedItemColor: selectedItemColor ?? Theme.of(context).colorScheme.secondary,
          unselectedItemColor: unselectedItemColor ?? Colors.grey,
          type: BottomNavigationBarType.fixed,
          elevation: 0
        ),
      ),
    );
  }
}