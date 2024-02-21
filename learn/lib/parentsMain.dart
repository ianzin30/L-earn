import 'package:flutter/material.dart';
import 'package:learn/pages/parentsPages/homePage.dart';
import '/widgets/navBar.dart';

import 'pages/parentsPages/activitiesPage.dart';
import 'pages/parentsPages/homePage.dart';
import 'pages/parentsPages/profilePage.dart';
import 'pages/parentsPages/monitoringPage.dart';

class ParentsMain extends StatefulWidget {
  @override
  _ParentsMainState createState() => _ParentsMainState();
}

class _ParentsMainState extends State<ParentsMain> {
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
      ParentsHPage(),
      ParentsActivitiesPage(),
      MonitorigPage(),
      ProfilePage()
    ];

    List<Map<String, dynamic>> navItems = [
      {'icon': Icons.home, 'name': 'Home'},
      {'icon': Icons.directions_run, 'name': 'Atividades'},
      {'icon': Icons.monitor, 'name': 'Monitoramento'},
      {'icon': Icons.person, 'name': 'Perfil'},
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
      bottomNavigationBar: LearnNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
        navItems: navItems,
      ),
    );
  }
}
