import 'package:flutter/material.dart';
import '/widgets/global/learnAppBar.dart';
import 'package:learn/widgets/globalProgressWidget.dart';

class ProfilePage extends StatelessWidget {
  final ValueNotifier<double> pagePosition;

  ProfilePage({
    required this.pagePosition
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LearnAppBarSuper(
        pageIndex: 3,
        pagePosition: pagePosition.value,
        superWidget: GlobalProgress(name: "Pedro", pontuation: 55),
        child: const Text('Perfil', style: TextStyle(color: Colors.white)),
      ),
      body: const Center(
        child: Text('Página do Perifl dos Pais'),
      ),
    );
  }
}
