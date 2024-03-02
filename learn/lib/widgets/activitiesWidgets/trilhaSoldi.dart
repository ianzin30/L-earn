import 'package:flutter/material.dart';
import 'package:learn/widgets/activitiesWidgets/activitieCardStatic.dart';
import 'package:learn/widgets/activitiesWidgets/activitieCardAnimated.dart';
import 'package:learn/utils/activitiesList.dart';

const isStatic = false;

class ActivitieContentRow extends StatelessWidget {
  final List<ActivitieCardStatic>? activities;

  ActivitieContentRow({
    this.activities
  });


  final List<Widget> atividades = activitiesList.map((e) =>
                                 Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                    child: 
                                      ActivitieCard(isActivitie: true ,activitie: 
                                        ActivitieCardStatic(                              
                                          level: e.level, title: e.title, description: e.description,
                                          progress: e.progress, isLocked: e.isLocked, backgroundGradientColors: e.backgroundGradientColors,
                                          levelGradientColors: e.levelGradientColors, progressColor: e.progressColor,
                                          pageWidget: e.pageWidget, width: 294, pageDescription: e.pageDescription, pageTitle: e.pageDescription,
                                        )))).toList();

  @override
  Widget build(BuildContext context) {
    return  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Trilhas em andamento',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 16,
                        fontFamily: "Fieldwork-Geo",
                        fontWeight: FontWeight.w600,
                      )),
          const Text('Continue de onde parou.',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 12,
                        fontFamily: "Fieldwork-Geo",
                      )),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: atividades,
            ),
          )
        ],
      );
  }

}
