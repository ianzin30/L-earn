import 'package:flutter/material.dart';
import '/utils/acheiviementsList.dart';
import 'package:learn/widgets/achivievementIcons.dart';

class AchievementsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Conquistas alcançadas",
                style: TextStyle(
                    color: Color(0xFF000000),
                    fontSize: 14,
                    fontFamily: 'Fieldwork-Geo',
                    fontWeight: FontWeight.w600)),
            const Text("Reconheça os seus filhos pelas suas vitórias!",
                style: TextStyle(
                    color: Color(0xFF383838),
                    fontSize: 12,
                    fontFamily: 'Fieldwork-Geo',
                    fontWeight: FontWeight.w400)),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AchievementIcon(
                      data: achievementsList[0],
                      heigth: screenWidth / 2 - 32,
                      width: screenWidth / 2 - 32),
                  const SizedBox(width: 16),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      AchievementIcon(
                        data: achievementsList[1],
                        heigth: (screenWidth / 2 - 32) /2 - 8,
                        width: screenWidth / 2 - 32,
                      ),
                      const SizedBox(height: 16),
                      Container(
                          width: screenWidth / 2 - 32,
                          height:(screenWidth / 2 - 32) /2 - 8 ,
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xFFF8D24D), Color(0xFFFEC224)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(12.5)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Ver todas as\nconquistas",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontFamily: 'Fieldwork-Geo',
                                      fontWeight: FontWeight.w800)),
                              Image.asset(
                                  'assets/images/appIcons/icon-award.png',
                                  height: 24),
                            ],
                          ))
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }
}