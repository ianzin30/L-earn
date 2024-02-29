import 'package:flutter/material.dart';
import '../../widgets/global/learnAppBar.dart';
import 'package:learn/widgets/monitoramento.dart';

class MonitorigPage extends StatelessWidget {
  final ValueNotifier<double> pagePosition;

  const MonitorigPage({required this.pagePosition, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LearnAppBar(
          pageIndex: 2,
          pagePosition: pagePosition.value,
          children: const [
            Text('Monitoramento', style: TextStyle(color: Colors.white)),
          ]),
      body: const Column(children: [
        UserProfileWidget(
          name: "Caio",
          age: 1,
          completedTrails: 14,
          level: 3,
          userPhotoPath: "assets/images/appImages/ianzinho.jpg",
        ),
      ]),
    );
  }
}
