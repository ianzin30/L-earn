import 'package:flutter/material.dart';
import '/widgets/mascotPopUp.dart';
import '/widgets/mascotProgressBar.dart';

class MascotPage extends StatelessWidget {

  final PageController pageController;

  MascotPage({
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            pageController.animateToPage(
              0,
              duration: Duration(milliseconds: 500),
              curve: Curves.ease,
            );
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
             child :MascotProgressBar(pontuation: 200, mascotName: "Pedro"),
             padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0)

          ),
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return MascotPopUp(
                onStartPressed: () {
                  pageController.animateToPage(
                    1,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
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
