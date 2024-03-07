import 'package:flutter/material.dart';
import 'package:learn/widgets/global/backButton.dart';
import 'package:learn/widgets/global/commonButton.dart';
import 'package:learn/widgets/lessionProgressBar.dart';

class FinalPage extends StatelessWidget {
  final PageController pageController;

  FinalPage({
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(alignment: AlignmentDirectional.center, children: [
      Container(
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color(0XFF7A7FFF),
            Color(0XFF040862),
          ],
          begin: Alignment.topLeft,
          end: Alignment.centerRight,
        )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 64,
            ),
            LearnBackButton(
              buttonColor: const Color(0xFFFFFFFF),
              iconColor: const Color(0xff101573),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(
              height: 80,
            ),
            Center(
              child: Image.asset(
                "assets/images/mascote/mascot-happy.png",
                height: 240,
              ),
            ),
            const SizedBox(height: 64,),
            
            Center(
              child: LessionProgressBar(percentage: 80.0,)
            ),
            
            const SizedBox(height: 36,),

            RichText(
                text: const TextSpan(
                    children: [
                      TextSpan(
                              text : "Atividade Completa!\n\n",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      TextSpan(text : "Parabéns por conseguir ajudar a Connie mais uma vez! Você fez excelentes escolhas, continue assim!",)
                    ],
                    style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Fieldwork-Geo"),
                    ),
                    textAlign: TextAlign.center,
                    ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
      Positioned(
          bottom: 120,
          child: LearnButton(
            text: const Text(
              "Continuar",
              style: TextStyle(
                color: Color(0xff101573),
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: "Fieldwork-Geo",
              ),
            ),
            buttonColor: const Color(0xFFFFFFFF),
            onPressed: () {
              Navigator.pop(context);
            },
          ))
    ]));
  }
}
