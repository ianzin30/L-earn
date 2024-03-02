import 'package:flutter/material.dart';
import '../../widgets/global/learnAppBar.dart';
import 'package:learn/widgets/StreakWidget.dart';
import 'package:learn/widgets/activitiesWidgets/trilhaSoldi.dart';
import '/widgets/achivievementWidget.dart';
import 'package:learn/widgets/user-profile.dart';
import 'package:learn/widgets/globalProgressWidget.dart';


class ChildMonitoring extends StatelessWidget {
  final ValueNotifier<double> pagePosition;
  final String name;
  final int age;
  final int level;

  const ChildMonitoring({
    required this.pagePosition, 
    required this.name,
    required this.age,
    required this.level,
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
        pagePosition: pagePosition.value,
        child: Container(
          padding: const  EdgeInsets.fromLTRB(14, 16, 14, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              UserPhotoAndName(
                userName: name,
                userPhotoPath: "assets/images/appImages/ianzinho.jpg",
                firstLine: "$name\n",
                fontWeight1: FontWeight.bold,
                secondLine: "$age anos",
                fontWeight2: FontWeight.w400,
              ),
              const StreakWidget(streakDays: 7),
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
