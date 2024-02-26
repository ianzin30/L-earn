import "package:flutter/material.dart";
import 'package:learn/widgets/activitiesWidgets/activitieCardStatic.dart';
import 'package:learn/widgets/activitiesWidgets/activitieCardAnimated.dart';
import 'package:learn/utils/activitiesList.dart';

const isStatic = false;


class YoursActivities extends StatelessWidget {
  final List<ActivitieCardStatic>? activities;

  YoursActivities({
    this.activities
  });
 

  final List<Widget> atividades = activitiesList.map((e) =>
                                 Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                    child: 
                                      ActivitieCard(activitie: 
                                        ActivitieCardStatic(
                                          level: e.level, title: e.title, description: e.description,
                                          progress: e.progress, isLocked: e.isLocked, backgroundGradientColors: e.backgroundGradientColors,
                                          levelGradientColors: e.levelGradientColors, progressColor: e.progressColor,
                                          onPressed: e.onPressed, width: 294,
                                        )))).toList();

  
  //final List<Widget> atividadesRow = atividades.map((e) => ActivitieCard(activitie: e.activitie.copyWith(width: 20)));


  @override
  Widget build(BuildContext context) {
    return Container(
      child: 
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Trilhas em Andamento",
            style:  TextStyle(color: Color(0XFF3C3C3C), fontSize:14, fontFamily: "Fieldwork-Geo", fontWeight:FontWeight.w600),
            textAlign: TextAlign.start,
            ),
            const Text(
            "Continue de onde parou",
            style:  TextStyle(color: Color(0XFF5C5C5C), fontSize:12, fontFamily: "Fieldwork-Geo", fontWeight:FontWeight.w400),
            textAlign: TextAlign.start,
            ),
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: atividades,
                )
            )
        ],
      ),
    );
  }
}