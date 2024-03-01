import 'package:flutter/material.dart';
import '/widgets/mascotWidgets/mascote.dart';
import '/widgets/mascotWidgets/mascotBar.dart';
import '/widgets/mascotWidgets/mascotSideBar.dart';
import 'package:learn/widgets/globalProgressWidget.dart';

class MascotPage extends StatelessWidget {

  final PageController pageController;


  MascotPage({
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MascotBar(pageController: pageController),
      body: Stack(
        children: [
          Container(
             padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 25.0),
             child: GlobalProgress(pontuation: 50, name: "Coinny") 
          ),
          MascoteWidget(),
          MascotSideBar(pageController: pageController),
        ],
      ),
    );
  }
}
