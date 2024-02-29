import 'package:flutter/material.dart';
import 'package:learn/widgets/global/learnAppBar.dart';
import 'package:learn/widgets/activitiesWidgets/activitieContentColumn.dart';
import 'package:learn/utils/activitiesList.dart';

class Activitie01 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LearnAppBarSuper(
        superWidget: activitiesList[0],
        backButtonFunction: () {Navigator.pop(context);},
        
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(14, 25, 14, 0),
        child: SingleChildScrollView(
          child:  ActivitieContentColumn(
          title: "Conteúdos das atividades",
          description: "Conheça as atividades"
        )
        )
      )
    );
  }
}
