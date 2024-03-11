import 'package:flutter/material.dart';
import 'package:learn/utils/modelsClass.dart';
import 'package:learn/widgets/activitiesWidgets/activitieCardStatic.dart';
import 'package:learn/widgets/global/learnAppBar.dart';
import 'package:learn/widgets/activitiesWidgets/activitieCardAnimated.dart';
import 'package:learn/utils/activitiesList.dart';
import 'package:learn/widgets/activitiesWidgets/activitiesList.dart';

class ChildrenActivitiesPage extends StatelessWidget {
  final ValueNotifier<double> pagePosition;
  final Children child;

  ChildrenActivitiesPage({required this.pagePosition, required this.child});

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: LearnAppBarSuper(
        superHeigth: 320,
        superWidget: RichText(
          text: const TextSpan(children: [
            TextSpan(
                text: 'Atividades\n',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: "Fieldwork-Geo",
                    fontWeight: FontWeight.w600)),
            TextSpan(
                text:
                    'Aprenda com o Connie sobre educação financeira,\nde forma lúdica e rápida.Vamos lá?!',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: "Fieldwork-Geo",
                    fontWeight: FontWeight.w300))
          ]),
        ),
        pageIndex: 1,
        pagePosition: pagePosition.value,
      ),
      body: Container(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                const Text(
                  'Suas atividades',
                  style: TextStyle(
                      color: Color(0xFF000000),
                      fontFamily: "Fieldwork-Geo",
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
                const Text(
                  'Realize suas atividades a qualquer momento',
                  style: TextStyle(
                      color: Color(0xFF5C5C5C),
                      fontFamily: "Fieldwork-Geo",
                      fontSize: 12,
                      fontWeight: FontWeight.w300),
                ),
                const SizedBox(height: 16),
                ActivitiesList(child: child)
              ]))),
    );
  }
}
