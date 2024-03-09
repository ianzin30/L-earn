import 'package:flutter/material.dart';
import '../../widgets/global/learnAppBar.dart';
import 'package:learn/widgets/StreakWidget.dart';
import '/widgets/achivievementWidget.dart';
import 'package:learn/widgets/user-profile.dart';
import 'package:learn/widgets/globalProgressWidget.dart';
import 'package:learn/utils/activitiesList.dart';
import 'package:learn/utils/modelsClass.dart';
import 'package:learn/widgets/activitiesWidgets/activitieCardStatic.dart';


class ChildMonitoring extends StatelessWidget {
  final Children children;

  const ChildMonitoring({
    required this.children,
    Key? key,
    })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LearnAppBarSuper(
        superHeigth: 400  - 24,
        globalHeigth: 360 - 24,
        superWidget: GlobalProgress(pontuation: 100, isMascot: false,),
        pageIndex: 1,
        backButtonFunction: () {
          Navigator.pop(context);
        },
        child: Container(
          padding: const  EdgeInsets.fromLTRB(14, 32, 14, 0),
          child: 
          Column (children: [
          const Text("Monitoramento",
          style: TextStyle(
            fontSize: 18,
            fontFamily: "Fieldwork-Geo",
            fontWeight: FontWeight.w700,
            color: Color(0xFFFFFFFF)
          ),),
          const SizedBox(height: 54,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              UserPhotoAndName(
                userName: children.name,
                userPhotoPath: children.photoPath,
                firstLine: '${children.name}\n',
                fontWeight1: FontWeight.bold,
                secondLine: "${diffYears(children.birthdate)} anos",
                fontWeight2: FontWeight.w400,
              ),
              StreakWidget(streakDays: diffDays(children.lastAccsess?? DateTime.now())),
            ]
          )
          ],)
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'Atividades em andamento\n',
                    style: TextStyle(
                      color: Color(0xFF222222),
                      fontFamily: "Fieldwork-Geo",
                      fontSize: 14,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  WidgetSpan(child: SizedBox(height: 16)),
                  TextSpan(
                    text: 'Veja a útima atividade de onde seu filho parou!',
                    style: TextStyle(
                      color: Color(0xFF5C5C5C),
                      fontFamily:"Fieldwork-Geo",
                      fontSize: 12,
                      fontWeight: FontWeight.w300
                    )
                  )
                ],
              ),
            ),
            const SizedBox(height:16),
            ActivitieCardStatic(
              activitie: activitiesList[children.lastActivitie],
              isLocked: false,
              progress: getProgress(children.lastActivitie, children.activities[children.lastActivitie]),
            ),
            const SizedBox(height: 40),
            AchievementsWidget(childAcheivments: children.acheivments,),
          ],
        ),
      ),
    );
  }
}
