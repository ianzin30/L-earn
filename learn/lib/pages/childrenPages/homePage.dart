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
    return Scaffold(
      appBar: 
      LearnAppBar(
        pageIndex: 0,
        pagePosition: pagePosition.value,
        children:  [
          const Text('Home', style: TextStyle(color: Colors.white)),
          
        ] 
      ),
      body: Column(
        children:[ 
          Container(
             padding: const EdgeInsets.fromLTRB(20.0, 22.0, 20.0, 10.0),
             child :LevelWidget(pontuation: 200, mascotName: "Pedro"),
          ),
          const Text('Página da Home das Crianças'),
          ]
      ),
    );
  }
}
