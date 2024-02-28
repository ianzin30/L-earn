import "package:flutter/material.dart";
import 'package:learn/widgets/activitiesWidgets/activitieCardStatic.dart';
import 'package:learn/widgets/activitiesWidgets/activitieCardAnimated.dart';
import 'package:learn/utils/activitiesList.dart';

const isStatic = false;


class ActivitieContentColumn extends StatelessWidget {
  final List<ActivitieCardStatic>? activities;

  ActivitieContentColumn({
    this.activities
  });
 

  final List<Widget> atividades = isStatic ? activitiesList
                                           : activitiesList.map((e) => Container(
                                                                        padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
                                                                        child: ActivitieCard(activitie: e))).toList();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: 
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Conteúdo das atividades",
            style:  TextStyle(color: Color(0XFF3C3C3C), fontSize:14, fontFamily: "Fieldwork-Geo", fontWeight:FontWeight.w600),
            textAlign: TextAlign.start,
            ),
            const Text(
            "Conheça as atividades",
            style:  TextStyle(color: Color(0XFF5C5C5C), fontSize:12, fontFamily: "Fieldwork-Geo", fontWeight:FontWeight.w400),
            textAlign: TextAlign.start,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: atividades,
            )
        ],
      ),
    );
  }
}