import 'package:flutter/material.dart';
import 'package:learn/widgets/activitiesWidgets/activitieCardStatic.dart';
import 'package:learn/widgets/global/learnAppBar.dart';
import 'package:learn/widgets/activitiesWidgets/activitieContentColumn.dart';
import 'package:learn/pages/activities/actitivitie_01/activitie01lessions.dart';

class ActivitieMain extends StatelessWidget {
  final ActivitieCardStatic content;

  ActivitieMain({
    required this.content
  });

  @override
  Widget build(BuildContext context) {
    final lista = content.lessionsList?? [];
    print("Temos ${lista.length} lessions");
    return Scaffold(
      appBar: LearnAppBarSuper(
        superWidget: content,
        backButtonFunction: () {Navigator.pop(context);},
        
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(14, 25, 14, 0),
        child: SingleChildScrollView(
          child:  ActivitieContentColumn(
          title: content.pageTitle,
          description: content.pageDescription,
          lessions: activitie01List,
        )
        )
      )
    );
  }
}
