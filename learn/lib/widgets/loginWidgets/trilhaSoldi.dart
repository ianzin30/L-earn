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

  // Ensure that the list 'atividades' is properly populated
  // depending on the 'isStatic' flag.
  // This is a placeholder for your list of widgets.
  final List<Widget> atividades = activitiesList.map((e) =>
                                 Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                    child: 
                                      ActivitieCard(activitie: 
                                        ActivitieCardStatic(
                                          level: e.level, title: e.title, description: e.description,
                                          progress: e.progress, isLocked: e.isLocked, backgroundGradientColors: e.backgroundGradientColors,
                                          levelGradientColors: e.levelGradientColors, progressColor: e.progressColor,
                                          pageWidget: e.pageWidget, width: 294,
                                        )))).toList();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5.5, top: 16), // This adds 14px padding on all sides
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Use a SingleChildScrollView to make the row scrollable horizontally.
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: atividades,
            ),
          )
        ],
      ),
    );
  }

}
