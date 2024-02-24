import 'package:flutter/material.dart';

class MascoteWidget extends StatelessWidget {
  final String backgroundName;
  final String mascotType;

  MascoteWidget({
    this.backgroundName="",
    this.mascotType="",
  });

  @override
  Widget build(BuildContext context) {
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
            child: Image.asset(
              'assets/images/mascote/mascote.png',
              width: MediaQuery.of(context).size.width * 0.6, // ajuste conforme necessário
            ),
          ),
      ],
    );
  }
}
