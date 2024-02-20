import 'package:flutter/material.dart';
import '/widgets/mascotPopUp.dart';

class MascotPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop(); // Volta para a HomePage da criança
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              'assets/images/mascote/background.png',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Image.asset(
              'assets/images/mascote/mascote.png',
              width: MediaQuery.of(context).size.width * 0.6, // ajuste conforme necessário
            ),
          ),
          // Aqui adicionaremos a NavBar lateral
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return MascotPopUp(
                onStartPressed: () {
                  // Aqui você pode adicionar a lógica que acontece quando o botão Iniciar é pressionado
                  Navigator.of(context).pop(); // Fecha o PopUp
                },
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
