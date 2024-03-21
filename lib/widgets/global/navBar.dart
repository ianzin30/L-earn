import 'package:flutter/material.dart';

class LearnNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;
  final List<Map<String, dynamic>> navItems;

  LearnNavBar({
    required this.selectedIndex,
    required this.onItemTapped,
    required this.navItems,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 16), // Ajuste para evitar overflow
      width: MediaQuery.of(context).size.width * 0.6,
      height: kToolbarHeight + 16, // Adicionei 16 para dar mais espaço e evitar overflow
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(16)),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 0.0,
            blurRadius: 10.0,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround, // Espaçamento igual entre os itens
          children: List.generate(navItems.length, (index) {
            String iconName = navItems[index]['name'].toString().toLowerCase();
            bool isSelected = selectedIndex == index;
            return InkWell(
              onTap: () => onItemTapped(index),
              splashColor: Colors.transparent, // Remover splash ao clicar
              highlightColor: Colors.transparent, // Remover highlight ao clicar
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Image.asset(
                    'assets/images/appIcons/icon-$iconName-${isSelected ? 'select' : 'default'}.png',
                    height: 24,
                  ),
                  Text(
                    navItems[index]['name'],
                    style: TextStyle(
                      fontFamily: "Fieldwork-Geo",
                      fontSize: 12,
                      color: isSelected ? Color(0xFF3034AD) : Color(0xFF49454F),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
