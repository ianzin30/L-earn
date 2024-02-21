import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  NavBar({required this.selectedIndex, required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.fitness_center), label: 'Atividades'),
        BottomNavigationBarItem(icon: Icon(Icons.monitor), label: 'Monitorar'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
      ],
      currentIndex: selectedIndex,
      onTap: onItemTapped,
      selectedItemColor: Colors.deepPurple.shade500,
      unselectedItemColor: Colors.grey,
      elevation: 10, // Remove shadow
    );
  }
}
