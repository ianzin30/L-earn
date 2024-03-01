import 'package:flutter/material.dart';
import '/utils/acheiviementsList.dart';
import 'package:learn/widgets/achivievementIcons.dart';

class AchievementsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;

    return Container(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Conquistas alcançadas",
                style: TextStyle(
                    color: Color(0xFF000000),
                    fontSize: 16,
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
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AchievementIcon(
                      data: achievementsList[0],
                      heigth: 140,
                      width: screenWidth / 2 - 20),
                  const SizedBox(width: 9),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      AchievementIcon(
                        data: achievementsList[1],
                        heigth: 60,
                        width: screenWidth / 2 - 40,
                      ),
                      const SizedBox(height: 12),
                      Container(
                          width: screenWidth / 2 - 40,
                          padding: EdgeInsets.all(15.0),
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
