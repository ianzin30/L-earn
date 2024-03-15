import 'package:flutter/material.dart';
import 'package:learn/utils/modelsClass.dart';

class MascoteWidget extends StatelessWidget {
  final String backgroundName;
  final String mascotType;
  final Children child;

  MascoteWidget({
    this.backgroundName="",
    this.mascotType="",
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    final int streakDays = diffDays(child.lastAccsess?? DateTime.now());
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              'assets/images/mascote/backgroundLarge.png',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child:(streakDays > 2)? Image.asset(
              'assets/images/mascote/mascote.png',
              width: MediaQuery.of(context).size.width * 0.6, // ajuste conforme necessário
            ): Image.asset(
              'assets/images/mascote/mascot-sad.png',
              width: MediaQuery.of(context).size.width * 0.6, // ajuste conforme necessário
            )
          ),
      ],
    );
  }
}
