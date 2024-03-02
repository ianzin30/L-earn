import 'package:flutter/material.dart';
import '../../widgets/global/learnAppBar.dart';
import '/widgets/achivievementWidget.dart';
import 'package:learn/widgets/user-profile.dart';
import 'package:learn/widgets/StreakWidget.dart';
import 'package:learn/widgets/globalProgressWidget.dart';


class ChildrenActivitiesPage extends StatelessWidget {
  final ValueNotifier<double> pagePosition;

  ChildrenActivitiesPage({
    required this.pagePosition
  });

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
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              UserPhotoAndName(
                userName: "Ian Braga",
                userPhotoPath: "assets/images/appImages/ianzinho.jpg",
              ),
              StreakWidget(streakDays: 7),
            ]
          )
        ),
      ),
      body: Center(
        child: AchievementsWidget(),
      ),
    );
  }
}
