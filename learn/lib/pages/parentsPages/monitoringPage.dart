import 'package:flutter/material.dart';
import 'package:learn/pages/parentsPages/childMonitoring.dart';
import '../../widgets/global/learnAppBar.dart';
import 'package:learn/widgets/monitoramento.dart';
import 'package:learn/widgets/achivievementWidget.dart';
import 'package:learn/utils/modelsClass.dart';

class MonitorigPage extends StatelessWidget {
  final ValueNotifier<double> pagePosition;
  final Parents parent;

  const MonitorigPage(
      {required this.pagePosition, required this.parent, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LearnAppBar(
        pageIndex: 2,
        pagePosition: pagePosition.value,
        child: Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(14, 48, 14, 0),
            child: RichText(
                text: const TextSpan(
                    children: [
                  TextSpan(
                    text: 'Monitoramento\n\n',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                  TextSpan(
                      text:
                          "Acompanhe o desempenho dos seus filhos em tempo real, visualize suas conquistas e comemorem juntos!",
                      style:
                          TextStyle(fontWeight: FontWeight.w300, fontSize: 12))
                ],
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Fieldwork-Geo',
                    )))),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(14, 16, 14, 16),
          child: Column(children: [
            AchievementsWidget(),
            const SizedBox(height: 24),
            MonitoringWidget(
              parent: parent,
            ), //ChildrenMonitoringBox(child: ,),
          ]),
        ),
      ),
    );
  }
}
