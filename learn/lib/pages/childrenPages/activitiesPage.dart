import 'package:flutter/material.dart';
import '/widgets/appBar.dart';

class ChildrenActivitiesPage extends StatelessWidget {
  final ValueNotifier<bool> isRounded;

  ChildrenActivitiesPage({
    required this.isRounded
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LearnAppBar(
        title: 'Atividades',
        isAppBarRounded: isRounded,
      ),
      body: Center(
        child: Text('Atividades Content'),
      ),
    );
  }
}
