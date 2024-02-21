import 'package:flutter/material.dart';
import '/widgets/appBar.dart';

class ParentsActivitiesPage extends StatelessWidget {
  final ValueNotifier<bool> isRounded;

  ParentsActivitiesPage({
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
        child: Text('Página de Atividades dos Pais'),
      ),
    );
  }
}
