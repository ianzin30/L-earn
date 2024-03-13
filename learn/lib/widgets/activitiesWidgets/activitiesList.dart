import 'package:flutter/material.dart';
import 'package:learn/utils/modelsClass.dart';
import 'package:learn/widgets/activitiesWidgets/activitieCardStatic.dart';
import 'package:learn/widgets/activitiesWidgets/activitieCardAnimated.dart';
import 'package:learn/utils/activitiesList.dart';

class ActivitiesList extends StatelessWidget {
  final Children child;
  const ActivitiesList({
    required this.child,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    final List<Widget> atividades = [];
    for (var i = 0; i < activitiesList.length; i++) {
      atividades.add(Container(
        padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
        child: ActivitieCard(
          activitie: ActivitieCardStatic(
            activitie:activitiesList[i],
            isLocked: i +1 > child.activities.length,
            progress: child.activities.length > i ? getProgress(i, child.activities[i]) : 0,
            ),
            child: child,
        ),
      ));
    }

    return Column(
      children: atividades,
    );
  }
}