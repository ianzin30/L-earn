import "package:flutter/material.dart";
import 'package:learn/utils/modelsClass.dart';
import 'package:learn/widgets/activitiesWidgets/newLessionCard.dart';

const isStatic = false;

class ActivitieContentColumn extends StatelessWidget {
  final String title;
  final String description;
  final List<Lession> lessions;
  int finishedLessions;

  ActivitieContentColumn(
      {required this.title,
      required this.description,
      required this.lessions,
      this.finishedLessions = 0});

  @override
  Widget build(BuildContext context) {
    final List<Widget> atividades = [];

    for (var i = 0; i < lessions.length; i++) {
      atividades.add(Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: LessionCardStatic(
          lession: lessions[i],
          isLocked: !(i <= finishedLessions),
          isFinished: i < finishedLessions,
        ),
      ));
    }

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 16),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                title,
                style: const TextStyle(
                    color: Color(0XFF3C3C3C),
                    fontSize: 14,
                    fontFamily: "Fieldwork-Geo",
                    fontWeight: FontWeight.w600),
              ),
              Text(
                description,
                style: const TextStyle(
                    color: Color(0XFF5C5C5C),
                    fontSize: 12,
                    fontFamily: "Fieldwork-Geo",
                    fontWeight: FontWeight.w400),
              ),
            ]),
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
