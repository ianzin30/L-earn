import 'package:flutter/material.dart';
import 'package:learn/widgets/global/learnAppBar.dart';
import 'package:learn/widgets/activitiesWidgets/activitieContentColumn.dart';

class ParentsActivitiesPage extends StatelessWidget {
  final ValueNotifier<double> pagePosition;

  ParentsActivitiesPage({
    required this.pagePosition
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LearnAppBar(
        pageIndex: 1,
        pagePosition: pagePosition.value,
        children: const [
          Text('Atividades', style: TextStyle(color: Colors.white)),
        ] 
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(14, 25, 14, 0),
        child: SingleChildScrollView(
          child: ActivitieContentColumn()
        )
      )
    );
  }
}
