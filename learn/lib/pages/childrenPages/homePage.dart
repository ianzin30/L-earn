import 'package:flutter/material.dart';
import 'package:learn/widgets/activitiesWidgets/activitieCardAnimated.dart';
import 'package:learn/widgets/activitiesWidgets/activitieCardStatic.dart';
import '../../widgets/global/learnAppBar.dart';
import 'package:learn/widgets/StreakWidget.dart';
import 'package:learn/widgets/activitiesWidgets/trilhaSoldi.dart';
import '/widgets/achivievementWidget.dart';
import 'package:learn/widgets/user-profile.dart';
import 'package:learn/widgets/globalProgressWidget.dart';
import 'package:learn/utils/modelsClass.dart';

class ChildrenHomePage extends StatelessWidget {
  final ValueNotifier<double> pagePosition;
  final Children child;

  const ChildrenHomePage({
    required this.pagePosition, 
    required this.child, 
    Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LearnAppBarSuper(
        superHeigth: 320,
        superWidget: GlobalProgress(
          pontuation: child.pontuation,
          isMascot: false,
        ),
        pageIndex: 1,
        pagePosition: pagePosition.value,
        child: Container(
          padding: const  EdgeInsets.fromLTRB(14, 54, 14, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              UserPhotoAndName(
                userName: child.name,
                userPhotoPath: child.photoPath,
                firstLine: "Seja bem-vindo,\n",
                fontWeight1: FontWeight.w400,
                secondLine: child.name,
                fontWeight2: FontWeight.bold,
              ),
              StreakWidget(streakDays: diffDays(child.lastAccsess?? DateTime.now())),
            ]
          )
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
                    text: 'Continue de onde parou!',
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
            ActivitieCard(
              activitie: ActivitieCardStatic(
              pageTitle: 'Home',
              pageDescription: 'Principal',
              level: 1,
              title: 'Passeando no Shopping',
              description: 'Você está saindo com seus amigos para o Shopping com pouco dinheiro. Aprenda como curtir da melhor forma!',
              backgroundGradientColors: const [Color(0XFFDA59AE), Color(0XFF4912A2)],
              isLocked: false,
              progress: 15.0,
            )),
            const SizedBox(height: 40),
            AchievementsWidget(),
          ],
        ),
      ),
    );
  }
}
