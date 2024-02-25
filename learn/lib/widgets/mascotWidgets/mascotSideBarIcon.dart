import 'package:flutter/material.dart';

class MascotSideBarIcon extends StatelessWidget {
    final String name;
    final PageController pageController;

  MascotSideBarIcon({
    required this.name,
    required this.pageController
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
            alignment: Alignment.bottomLeft,
            icon: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                  Image.asset(
                    'assets/images/mascote/$name-Button.png',
                    height: 30,
                  ),
                  Text(name,
                  style: TextStyle(color:  Color(0xFF898989), fontSize: 10, fontFamily: "Fieldwork-Geo", fontWeight: FontWeight.w700,),
                  textAlign: TextAlign.center
                  )
              ],
            ),
            onPressed: () {
              pageController.previousPage(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            },
          );
    }
}
