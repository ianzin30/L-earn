import 'package:flutter/material.dart';
import 'package:learn/widgets/achivievementIcons.dart';
import 'package:learn/utils/modelsClass.dart';
import 'package:learn/pages/childrenPages/acheivementsPage.dart';

class AchievementsWidgetSpecific extends StatelessWidget {
  final List<AcheivmentsDate> childAcheivments;

  AchievementsWidgetSpecific({required this.childAcheivments});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AchievementIcon(
                  achievmentId: childAcheivments[1].id,
                  conclusionDate: childAcheivments[1].date,
                  heigth: (screenWidth / 2 - 24)*1.1,
                  width: screenWidth / 2 - 24),
              const SizedBox(width: 16),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AchievementIcon(
                    achievmentId: childAcheivments[0].id,
                    conclusionDate: childAcheivments[0].date,
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
                              colors: [Color.fromARGB(255, 59, 59, 59), Color.fromARGB(255, 61, 61, 61)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(12.5)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: const Text("Ver todas as\nconquistas",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontFamily: 'Fieldwork-Geo',
                                      )),
                            ),
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
