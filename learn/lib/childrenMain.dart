import 'package:flutter/material.dart';
import '/widgets/appBar.dart';
import '/widgets/navBar.dart';
import '/pages/childrenPages/homePage.dart';
import '/pages/childrenPages/activitiesPage.dart';
import '/pages/childrenPages/MascotPage.dart';

class ChildrenMain extends StatefulWidget {
  @override
  _ChildrenMainState createState() => _ChildrenMainState();
}

class _ChildrenMainState extends State<ChildrenMain> {
  int _selectedIndex = 0;
  PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _pageOptions = [
      ChildrenHomePage(),
      ChildrenActivitiesPage(),
      MascotPage(), // MascotPage não terá AppBar ou NavBar
    ];

    // Configuração da LearnNavBar com base nos ícones e textos desejados
    List<Map<String, dynamic>> navItems = [
      {'icon': Icons.home, 'name': 'Home'},
      {'icon': Icons.gamepad, 'name': 'Atividades'},
      // O MascotPage não aparece na NavBar
    ];

    return Scaffold(
      appBar: _selectedIndex != 2 ? LearnAppBar(title: navItems[_selectedIndex]['name']) : null, // Esconde a AppBar na página do mascote
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: _pageOptions,
      ),
      bottomNavigationBar: _selectedIndex != 2 ? LearnNavBar( // Esconde a NavBar na página do mascote
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
        navItems: navItems,
      ) : null,
    );
  }
}
