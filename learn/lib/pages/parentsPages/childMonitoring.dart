import 'package:flutter/material.dart';
import '../../widgets/global/learnAppBar.dart';
import 'package:learn/widgets/StreakWidget.dart';
import 'package:learn/widgets/activitiesWidgets/trilhaSoldi.dart';
import '/widgets/achivievementWidget.dart';
import 'package:learn/widgets/user-profile.dart';
import 'package:learn/widgets/globalProgressWidget.dart';
import 'package:learn/utils/modelsClass.dart';


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
        superHeigth: 320,
        superWidget: GlobalProgress(pontuation: 100, isMascot: false,),
        pageIndex: 1,
        child: Container(
          padding: const  EdgeInsets.fromLTRB(14, 16, 14, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              UserPhotoAndName(
                userName: children.name,
                userPhotoPath: children.photoPath,
                firstLine: children.name,
                fontWeight1: FontWeight.bold,
                secondLine: "${diffYears(children.birthdate)} anos",
                fontWeight2: FontWeight.w400,
              ),
              StreakWidget(streakDays: diffDays(children.lastAccsess?? DateTime.now())),
            ]
          )
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ActivitieContentRow(),
                const SizedBox(height: 40),
                AchievementsWidget(),
              ],
            ),
          ),
    );
  }
}
