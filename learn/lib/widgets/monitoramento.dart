import 'package:flutter/material.dart';
import 'package:learn/pages/parentsPages/childMonitoring.dart';
import 'package:learn/utils/modelsClass.dart';

class MonitoringWidget extends StatelessWidget {
  final Parents parent;
  final String title;
  final String description;

  const MonitoringWidget(
      {required this.parent,
      this.title = "Monitoramento\n",
      this.description = 'Acompanhe o progresso de seus filhos.',
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: 'Monitoramento\n',
                  style: TextStyle(
                    color: Color(0xFF222222),
                    fontSize: 14,
                    fontFamily: "Fieldwork-Geo",
                    fontWeight: FontWeight.w600,
                  ),
                ),
                WidgetSpan(
                  child: SizedBox(height: 16.0),
                ),
                TextSpan(
                  text: 'Acompanhe o progresso de seus filhos.',
                  style: TextStyle(
                    color: Color(0xFF5C5C5C),
                    fontSize: 12,
                    fontFamily: "Fieldwork-Geo",
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16,),
        Column(
          children: parent.dependents
              .map((child) => ChildMonitoringBox(
                    child: child,
                  ))
              .toList(),
        )
      ],
    ));
  }
}

class ChildMonitoringBox extends StatelessWidget {
  final Children child;

  const ChildMonitoringBox({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ChildMonitoring(
                        children: child,
                      )));
        },
        child: Container(
          //margin: const EdgeInsets.symmetric(horizontal: 14),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(child.photoPath, height: 48),
              ),
              const SizedBox(width: 16.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(child.name,
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Fieldwork-Geo')),
                  Text('${diffYears(child.birthdate)} anos',
                      style: const TextStyle(
                          fontSize: 10, fontFamily: 'Fieldwork-Geo')),
                  const Row(children: [
                    LevelBox(text: "Prata I"),
                    LevelBox(text: "12 trilhas concluídas"),
                  ])
                ],
              ),
              const Spacer(),
              Image.asset(
                "assets/images/appIcons/silver-badge.png",
                width: 60,
              )
            ],
          ),
        ));
  }
}

class LevelBox extends StatelessWidget {
  final String text;

  const LevelBox({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 4),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFFEFEFE),
        borderRadius: BorderRadius.circular(3.75),
        //border: Border.all(color: const Color(0xFFA9A9A9), width: 1),
        boxShadow: const [
          BoxShadow(
            color: Color(0xFFA9A9A9),
            spreadRadius: 0.01,
            blurRadius: 0.75,
            offset: Offset(0, 3),
          )
        ],
      ),
      child: Text(text,
          style: const TextStyle(
              fontSize: 8,
              fontWeight: FontWeight.w600,
              fontFamily: 'Fieldwork-Geo')),
    );
  }
}
