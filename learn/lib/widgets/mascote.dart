import 'package:flutter/material.dart';

class MascoteWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Image.asset(
            './assets/images/mascote/background.png',
            fit: BoxFit.fitWidth,
          ),
        ),
        Image.asset(
          './assets/images/mascote/mascote.png',
          width: MediaQuery.of(context).size.width * 0.5, // Ajuste a largura conforme necessário
        ),
        // Adicione outros elementos da UI aqui, se necessário
      ],
    );
  }
}
