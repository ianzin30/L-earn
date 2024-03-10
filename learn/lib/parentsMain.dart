import 'package:flutter/material.dart';
import 'package:learn/pages/parentsPages/homePage.dart';
import 'widgets/global/navBar.dart';
import 'pages/parentsPages/profilePage.dart';
import 'pages/parentsPages/monitoringPage.dart';

// Dados mockados
import 'package:learn/utils/modelsClass.dart';

class ParentsMain extends StatefulWidget {
  final Parents parent;

  ParentsMain({required this.parent});

  @override
  _ParentsMainState createState() => _ParentsMainState();
}

class _ParentsMainState extends State<ParentsMain> {
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
      ParentsHPage(
        pagePosition: pagePosition,
        parent: widget.parent,
      ),
      MonitorigPage(pagePosition: pagePosition, parent: widget.parent),
      ProfilePage(
        pagePosition: pagePosition,
        parent: widget.parent,
        pageController: _pageController,
      )
    ];

    List<Map<String, dynamic>> navItems = [
      {'icon': Icons.home, 'name': 'Home'},
      {'icon': Icons.monitor, 'name': 'Monitorar'},
      {'icon': Icons.person, 'name': 'Perfil'},
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
        Positioned(
            left: 32,
            right: 32,
            bottom: 32,
            child: LearnNavBar(
              selectedIndex: _selectedIndex,
              onItemTapped: _onItemTapped,
              navItems: navItems,
            ))
      ],
    ));
  }
}
