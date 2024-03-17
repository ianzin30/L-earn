import 'package:flutter/material.dart';
import 'package:learn/widgets/activitiesWidgets/activitieCardStatic.dart';
import 'package:learn/widgets/global/learnAppBar.dart';
import 'package:learn/widgets/activitiesWidgets/activitieContentColumn.dart';
import 'package:learn/utils/modelsClass.dart';

class ActivitieMain extends StatelessWidget {
  final ActivitieCardStatic content;
  final Children? child;

  ActivitieMain({required this.content, this.child});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: LearnAppBarSuper(
          superHeigth: 280,
          globalHeigth: 280,
          superWidget: content,
          child: Container(
              //width: MediaQuery.sizeOf(context).width,
              padding: EdgeInsets.fromLTRB(
                  (MediaQuery.sizeOf(context).width / 2) - 48, 40, 16, 0),
              child: const Text(
                "Atividades",
                style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontFamily: "Fieldwork-Geo",
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              )),
          backButtonFunction: () {
            Navigator.pop(context);
          },
        ),
        body: Container(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: SingleChildScrollView(
                child: ActivitieContentColumn(
              title: "Conteúdo das atividades",
              description: "Selecione a atividade",
              lessions: content.activitie.lessionsList,
              finishedLessions: child?.activities[content.activitie.id].length ?? 0,
            ))));
  }
}
