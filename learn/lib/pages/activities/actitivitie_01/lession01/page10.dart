import 'package:flutter/material.dart';
import 'package:learn/widgets/global/backButton.dart';
import '../lession02/page01.dart';
import 'package:learn/widgets/global/commonButton.dart';

class Page10 extends StatelessWidget {
  final PageController pageController;

  Page10({
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    const TextStyle textStyle = TextStyle(
        color: Color(0xFFFFFFFF),
        fontSize: 18,
        fontWeight: FontWeight.w400,
        fontFamily: "Fieldwork-Geo");

    const TextStyle textStyleBold = TextStyle(
        color: Color(0xFFFFFFFF),
        fontSize: 20,
        fontWeight: FontWeight.w700,
        fontFamily: "Fieldwork-Geo");

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
              height: 64,
            ),
            RichText(
                text: const TextSpan(
                    children: [
                  TextSpan(text:"Legal! Mas imagina se quando a Connie chegasse no cinema, o ",),
                  TextSpan(text:"preço",style: TextStyle(fontWeight: FontWeight.w700)),
                  TextSpan(text: " de todos os ",),
                  TextSpan(text: "ingressos",style: TextStyle(fontWeight: FontWeight.w700)),
                  TextSpan(text:" tivessem ",),
                  TextSpan(text:"aumentado",style: TextStyle(fontWeight: FontWeight.w700)),
                  TextSpan(text:"? É importante ela se planejar para ",),
                  TextSpan(text:"imprevistos",style: TextStyle(fontWeight: FontWeight.w700)),
                  TextSpan(text:" também!",),
                ],
                    style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Fieldwork-Geo")),
                        
                      textAlign: TextAlign.center, 
                        ),
            const SizedBox(
              height: 128,
            ),
            Center(
              child: Image.asset(
                "assets/images/mascote/mascot-happy.png",
                height: 240,
              ),
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
              pageController.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease
              );
            },
          ))
    ]));
  }
}
