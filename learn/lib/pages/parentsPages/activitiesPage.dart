import 'package:flutter/material.dart';
import '/widgets/appBar.dart';

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
      body: const Center(
        child: Text('Página de Atividades dos Pais'),
      ),
    );
  }
}
