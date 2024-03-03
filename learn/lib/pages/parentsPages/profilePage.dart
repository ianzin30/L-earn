import 'package:flutter/material.dart';
import 'package:learn/widgets/globalProgressWidget.dart';
import '/widgets/global/learnAppBar.dart';
import 'package:learn/pages/parentsPages/childMonitoring.dart';
import 'package:learn/widgets/monitoramento.dart';
import 'package:learn/widgets/achivievementWidget.dart';
import 'package:learn/utils/modelsClass.dart';


class ProfilePage extends StatelessWidget {
  final ValueNotifier<double> pagePosition;
  final Parents parent;

  ProfilePage({
    required this.pagePosition,
    required this.parent
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LearnAppBarSuper(
        pageIndex: 3,
        superWidget: GlobalProgress(pontuation: 100, isMascot: false,),
        pagePosition: pagePosition.value,
        child: const Text('Perfil', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView( // Adicionado para tornar a coluna rolável
        child: Container(
          padding: const EdgeInsets.fromLTRB(14, 16, 14, 16),
          child: Column(children: [
            AchievementsWidget(),
            const SizedBox(height: 24),
            Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 16.0), // Exclusive padding for this instance
                child: MonitoringWidget(parent: parent,),
            ),
          ]),
        ),
      ),
    );
  }
}
