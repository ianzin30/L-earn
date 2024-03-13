import 'package:flutter/material.dart';
import 'package:learn/widgets/achivievementIcons.dart';
import 'package:learn/utils/modelsClass.dart';
import 'package:learn/pages/childrenPages/acheivementsPage.dart';

class AchievementsWidget extends StatelessWidget {
  final List<AcheivmentsDate> childAcheivments;

  AchievementsWidget({required this.childAcheivments});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Conquistas alcançadas",
            style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 14,
                fontFamily: 'Fieldwork-Geo',
                fontWeight: FontWeight.w600)),
        const Text("Reconheça os seus filhos pelas suas vitórias!",
            style: TextStyle(
                color: Color(0xFF5C5C5C),
                fontSize: 12,
                fontFamily: 'Fieldwork-Geo',
                fontWeight: FontWeight.w300)),
        const SizedBox(
          height: 12,
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AchievementIcon(
                  achievmentId: childAcheivments[0].id,
                  conclusionDate: childAcheivments[0].date,
                  heigth: (screenWidth / 2 - 24)*1.1,
                  width: screenWidth / 2 - 24),
              const SizedBox(width: 16),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AchievementIcon(
                    achievmentId: childAcheivments[1].id,
                    conclusionDate: childAcheivments[1].date,
                    heigth: (((screenWidth / 2 - 24)*1.1)*2/3)-8,
                    width: screenWidth / 2 - 24,
                  ),
                  const SizedBox(height: 16),
                  InkWell(
                    child: Container(
                        width: screenWidth / 2 - 24,
                        height: (((screenWidth / 2 - 24)*1.1)*1/3)-8,
                        padding: const EdgeInsets.all(8.0),
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
                            Image.asset('assets/images/appIcons/icon-award.png',
                                height: 24),
                          ],
                        )),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AchiviementsPage(
                                  childAcheivments: childAcheivments)));
                    },
                  )
                ],
              )
            ],
          ),
      ],
    ));
  }
}
