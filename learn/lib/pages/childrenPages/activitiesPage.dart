import 'package:flutter/material.dart';
import 'package:learn/utils/modelsClass.dart';
import 'package:learn/widgets/activitiesWidgets/activitieCardStatic.dart';
import 'package:learn/widgets/activitiesWidgets/activitieContentColumn.dart';
import '../../widgets/global/learnAppBar.dart';
import '/widgets/achivievementWidget.dart';
import 'package:learn/widgets/user-profile.dart';
import 'package:learn/widgets/StreakWidget.dart';
import 'package:learn/widgets/globalProgressWidget.dart';


class ChildrenActivitiesPage extends StatelessWidget {
  final ValueNotifier<double> pagePosition;
  final Children child;

  ChildrenActivitiesPage({
    required this.pagePosition,
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LearnAppBarSuper(
        superHeigth: 320,
        superWidget: RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: 'Atividades\n',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: "Fieldwork-Geo",
                  fontWeight: FontWeight.w600
                )
              ),
              TextSpan(
                text: 'Aprenda com o Connie sobre educação financeira\nde forma lúdica e rápida.Vamos lá?!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontFamily: "Fieldwork-Geo",
                  fontWeight: FontWeight.w400
                )
              )
            ]
          ),
        ),
        pageIndex: 1,
        pagePosition: pagePosition.value,
      ),
      body: Center(
        child: ActivitieContentColumn(
          title:'Suas atividades',
          description: 'Realize suas atividades a qualquer momento', 
          lessions: [
            LessionCardStatic(
              level: 1, 
              title: 'trilha 01', 
              description: 'lenda',
              isLocked: false,
              progress: 50,
              backgroundGradientColors: const [Color(0xFFDA59AE), Color(0xFF4912A2)],
            ),
            LessionCardStatic(
              level: 2, 
              title: 'trilha 02', 
              description: 'triste'
            ),
            LessionCardStatic(
              level: 3,
              title: 'trilha 03',
              description: 'oiiiii'
            ),
            LessionCardStatic(
              level: 4,
              title: 'trilha 04',
              description: 'oiiiii'
            )
          ]),
      ),
    );
  }
}
