import 'package:flutter/material.dart';
import 'widgets/global/navBar.dart';
import '/pages/childrenPages/homePage.dart';
import '/pages/childrenPages/activitiesPage.dart';
import '/pages/childrenPages/MascotPage.dart';
import 'package:learn/utils/modelsClass.dart';

class ChildrenMain extends StatefulWidget {
  @override
  _ChildrenMainState createState() => _ChildrenMainState();
}

class _ChildrenMainState extends State<ChildrenMain> {
  int _selectedIndex = 0;
  PageController _pageController = PageController();
  ValueNotifier<double> pagePosition = ValueNotifier(0.0);

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
    _pageController.addListener(() {
      if (pagePosition.value != _pageController.page) {
        setState(() {
          pagePosition.value = _pageController.page!;
        });
      }
    });
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
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _pageOptions = [
      ChildrenHomePage(pagePosition: pagePosition),
      ChildrenActivitiesPage(pagePosition: pagePosition),
      MascotPage(pageController: _pageController),
    ];

    List<Map<String, dynamic>> navItems = [
      {'icon': Icons.home, 'name': 'Home'},
      {'icon': Icons.gamepad, 'name': 'Atividades'},
      {'icon': Icons.network_ping_outlined, 'name': 'Mascote'},
    ];

    return Scaffold(
      body: Stack(
        children: [
      PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: _pageOptions,
      ),
      if (_selectedIndex != 2)
      Positioned(
        left: 32,
        right: 32,
        bottom: 32,
        child: LearnNavBar(
              selectedIndex: _selectedIndex,
              onItemTapped: _onItemTapped,
              navItems: navItems,
            )
      )
      ]),
    );
  }
}
