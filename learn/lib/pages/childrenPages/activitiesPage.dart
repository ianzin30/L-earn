import 'package:flutter/material.dart';
import '../../widgets/global/learnAppBar.dart';
import '/widgets/achivievementWidget.dart';

class ChildrenActivitiesPage extends StatelessWidget {
  final ValueNotifier<double> pagePosition;

  ChildrenActivitiesPage({
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
      body: Center(
        child: AchievementsWidget(),
      ),
    );
  }
}
