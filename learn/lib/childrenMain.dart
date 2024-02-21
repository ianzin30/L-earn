import 'package:flutter/material.dart';
import 'package:flutter_iconify/flutter_iconify.dart';

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
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _pageOptions = [
      ChildrenHomePage(),
      ChildrenActivitiesPage(),
      MascotPage(),
    ];

    List<Map<String, dynamic>> navItems = [
      {'icon': Icons.home, 'name': 'Home'},
      {'icon': Icons.gamepad, 'name': 'Atividades'},
      {'icon': Icons.network_ping_outlined, 'name': 'Mascote'		}
    ];

    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: _pageOptions,
      ),
      bottomNavigationBar: _selectedIndex != 2 ? LearnNavBar( 
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
        navItems: navItems,
      ) : null,
    );
  }
}
