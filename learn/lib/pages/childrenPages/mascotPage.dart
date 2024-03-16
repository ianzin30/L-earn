import 'package:flutter/material.dart';
import 'package:learn/utils/modelsClass.dart';
import 'package:learn/widgets/mascot/mascote.dart';
import 'package:learn/widgets/mascot/mascotBar.dart';
import 'package:learn/widgets/mascot/mascotSideBar.dart';
import 'package:learn/widgets/globalProgressWidget.dart';
import 'package:provider/provider.dart';


class MascotPage extends StatelessWidget {

  final PageController pageController;
  final Children child;


  MascotPage({
    required this.pageController,
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    VolatileChildren children = Provider.of<VolatileChildren>(context);
    return Scaffold(
      appBar: MascotBar(pageController: pageController),
      body: Stack(
        children: [
          Container(
             padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 25.0),
             child: GlobalProgress(pontuation: children.value.pontuation, name: "Coinny") 
          ),
          MascoteWidget(child: child),
          MascotSideBar(pageController: pageController),
        ],
      ),
    );
  }
}
