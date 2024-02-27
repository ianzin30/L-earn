import 'package:flutter/material.dart';
import '/utils/acheiviementsList.dart';
import 'dart:ui';

class AchievementIcon extends StatelessWidget {
  final AchivievementData data;
  final double heigth;
  final double width;

  AchievementIcon({
    required this.data,
    required this.heigth,
    required this.width
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: data.colors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12.5), // Arredondamento das bordas
        boxShadow: const [
          BoxShadow(
            color: Color(0xFFA1A1A1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0,0),
          )
        ]
      ),
      child: Stack(
        children: [
          Center(
              child: Container (
                padding: EdgeInsets.all(20.0),
                child: Opacity(
                  opacity: 0.5,
                  child: Image.asset(
                     'assets/images/appIcons/icon-trophie.png',
                     height: heigth,
                     
                    ),
                )
              )
          ),
          Positioned (
            left: 5.0,
            right: 5.0,
            bottom: 5.0,
            child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    padding: EdgeInsets.all(10.0), 
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(10.0)

                    ),
                    child: Row( 
                      children : [
                        Container(
                          child: Image.asset('assets/images/appIcons/icon-award.png',
                          height: 15)
                        ),
                        const SizedBox(width: 3),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children : [
                          Text(
                          data.nome,
                          style: const TextStyle(color: Colors.white, fontSize: 11.75, fontFamily: 'Fieldwork-Geo', fontWeight: FontWeight.w700),
                          ),
                          Text(
                          data.data,
                          style: const TextStyle(color: Colors.white, fontSize: 10, fontFamily: 'Fieldwork-Geo', fontWeight: FontWeight.w300),
                          ),
                          ]
                      )
                      ]
                  ),
                  ),
                ),
              ),
          )
        ],
      ),
    );
  }
}