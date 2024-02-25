import 'package:flutter/material.dart';
import '/widgets/mascotWidgets/mascotPopUp.dart';
import '/widgets/mascotWidgets/mascotProgressBar.dart';
import '/widgets/mascotWidgets/mascote.dart';
import '/widgets/mascotWidgets/mascotBar.dart';
import '/widgets/mascotWidgets/mascotSideBar.dart';

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
             child :MascotProgressBar(pontuation: 200, mascotName: "Pedro"),
          ),
          MascoteWidget(),
          MascotSideBar(pageController: pageController),
        ],
      ),
    );
  }
}
