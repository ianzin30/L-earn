import 'package:flutter/material.dart';
import '../../widgets/global/appBar.dart';
import 'package:learn/widgets/activitieCard.dart';
import 'package:learn/utils/activitiesList.dart';

class ParentsActivitiesPage extends StatelessWidget {
  final ValueNotifier<double> pagePosition;

  ParentsActivitiesPage({
    required this.pagePosition
  });

  final List<ActivitieCard> atividades = activitiesList;

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Conteúdo das atividades",
                style:  TextStyle(color: Color(0XFF3C3C3C), fontSize:14, fontFamily: "Fieldwork-Geo", fontWeight:FontWeight.w600),
                textAlign: TextAlign.start,
                ),
                const Text(
                "Conheça as atividades",
                style:  TextStyle(color: Color(0XFF5C5C5C), fontSize:12, fontFamily: "Fieldwork-Geo", fontWeight:FontWeight.w400),
                textAlign: TextAlign.center,
                ),
                Column(
                  children: atividades,
                )
            ],
          )
        )
      )
    );
  }
}
