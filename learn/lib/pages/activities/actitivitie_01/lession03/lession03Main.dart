import 'package:flutter/material.dart';
import 'package:learn/pages/activities/actitivitie_01/lession03/page01.dart';
import 'package:learn/pages/activities/actitivitie_01/lession03/page02.dart';

class Lession03Main extends StatefulWidget {
  const Lession03Main({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Lession03MainState createState() => _Lession03MainState();
}

class _Lession03MainState extends State<Lession03Main> {
  int _selectedIndex = 0;
  PageController _pageController = PageController();
  ValueNotifier<double> pagePosition = ValueNotifier(0.0);

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

  @override
  Widget build(BuildContext context) {
    List<Widget> _pageOptions = [
      Page01(pageController: _pageController),
      Page02(pageController: _pageController),
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
    );
  }
}
