import 'package:flutter/material.dart';
import '/widgets/appBar.dart';
import 'package:learn/widgets/levelWidget.dart';

class ChildrenHomePage extends StatelessWidget {
  final ValueNotifier<double> pagePosition;

  ChildrenHomePage({
    required this.pagePosition
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: LearnAppBar(
              pageIndex: 0,
              pagePosition: pagePosition.value,
              children: const [
                Text('Home', style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
          Positioned(
            top: 150,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.fromLTRB(20.0, 22.0, 20.0, 10.0),
              child: LevelWidget(pontuation: 200, mascotName: "Pedro"),
            ),
          ),
          // O restante do conteúdo começa abaixo do AppBar e LevelWidget.
          Positioned(
            top: screenHeight/2,
            left: 0,
            right: 0,
            child: Column(
              children:  [
                Text('Página da Home das Crianças'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
