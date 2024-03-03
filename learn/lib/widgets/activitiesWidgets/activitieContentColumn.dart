import "package:flutter/material.dart";
import 'package:learn/widgets/activitiesWidgets/activitieCardStatic.dart';
import 'package:learn/widgets/activitiesWidgets/activitieCardAnimated.dart';
import 'package:learn/utils/activitiesList.dart';

const isStatic = false;

class ActivitieContentColumn extends StatelessWidget {
  final String title;
  final String description;
  final List<LessionCardStatic> lessions;

  ActivitieContentColumn({
    required this.title, 
    required this.description,
    required this.lessions,
  });
 


  final List<Widget> atividades = isStatic ? activitiesList
                                           : activitiesList.map((e) => Container(
                                                                        padding: const EdgeInsets.fromLTRB(4, 16, 4, 16),
                                                                        child: ActivitieCard(activitie: e))).toList();

  

  @override
  Widget build(BuildContext context) {
  final List<Widget> lessionsAnimated = lessions.map((e) => Container(
                                                                        padding: const EdgeInsets.fromLTRB(4, 8, 4, 8),
                                                                        child: ActivitieCard(activitie: ActivitieCardStatic(
                                                                          title: e.title, 
                                                                          description: e.description, 
                                                                          pageDescription: "",
                                                                          pageTitle: "", 
                                                                          level: e.level,
                                                                          isLocked: e.isLocked,
                                                                          backgroundGradientColors: e.backgroundGradientColors,
                                                                          levelGradientColors: e.levelGradientColors,
                                                                          pageWidget: e.pageWidget,
                                                                          isActivitie: false,
                                                                          )))).toList();
    

    return SingleChildScrollView (
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Container(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style:  const TextStyle(color: Color(0XFF3C3C3C), fontSize:14, fontFamily: "Fieldwork-Geo", fontWeight:FontWeight.w600),
                  ),
                  Text(
                    description,
                    style: const TextStyle(color: Color(0XFF5C5C5C), fontSize:12, fontFamily: "Fieldwork-Geo", fontWeight:FontWeight.w400),
                  ),
                ]
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: lessionsAnimated,
            )
        ],
      ),
    );
  }
}