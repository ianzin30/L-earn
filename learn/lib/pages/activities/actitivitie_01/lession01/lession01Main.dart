import 'package:flutter/material.dart';
import './page1.dart';


class Lession01Main extends StatefulWidget {
  @override
  _Lession01MainState createState() => _Lession01MainState();
}

class _Lession01MainState extends State<Lession01Main> {
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
      MascotPage(pageController: _pageController),
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
