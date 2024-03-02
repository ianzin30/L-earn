import 'package:flutter/material.dart';

class CustomRichTextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.only(left: 16.0), // Ajuste o valor do padding conforme necessário
      alignment: Alignment.centerLeft, // Alinha o widget RichText à esquerda
      child: RichText(
        text: const TextSpan(
          children: [
            TextSpan(
              text: 'Monitoramento\n',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 14,
                fontFamily: "Fieldwork-Geo",
                fontWeight: FontWeight.bold,
              ),
            ),
            WidgetSpan(
              child: SizedBox(
                  height: 16.0), // Adiciona um espaço vertical entre os textos
            ),
            TextSpan(
              text: 'Acompanhe o progresso de seus filhos.',
              style: TextStyle(
                color: Color(0xFF5C5C5C),
                fontSize: 12,
                fontFamily: "Fieldwork-Geo",
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MonitoramentoBox extends StatelessWidget {
  final String text;

  const MonitoramentoBox({required this.text, super.key});

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

class UserProfileWidget extends StatelessWidget {
  final String name;
  final int age;
  final int level;
  final int completedTrails;
  final String userPhotoPath;

  const UserProfileWidget({
    required this.name,
    required this.userPhotoPath,
    required this.age,
    required this.level,
    required this.completedTrails,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 14),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(userPhotoPath, height: 48),
              ),
              const SizedBox(width: 16.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name,
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Fieldwork-Geo')),
                  Text('$age anos',
                      style: const TextStyle(
                          fontSize: 10, fontFamily: 'Fieldwork-Geo')),
                  const Row(children: [
                    MonitoramentoBox(text: "Prata II"),
                    MonitoramentoBox(text: "12 trilhas concluídas"),
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
        );
      },
    );
  }
}
