import 'package:flutter/material.dart';
import 'package:learn/pages/parentsPages/childMonitoring.dart';
import '../../widgets/global/learnAppBar.dart';
import 'package:learn/widgets/monitoramento.dart';
import 'package:learn/widgets/achivievementWidget.dart';

class MonitorigPage extends StatelessWidget {
  final ValueNotifier<double> pagePosition;

  const MonitorigPage({required this.pagePosition, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LearnAppBar(
        pageIndex: 2,
        pagePosition: pagePosition.value,
        child: Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.fromLTRB(14, 16, 14, 0),
          child: const Text(
            'Monitoramento', 
            style: TextStyle(
              color: Colors.white, 
              fontFamily: 'Fieldwork-Geo',
              fontSize: 18
            ),
          ),
        ),
      ),
      
      body: SingleChildScrollView( // Adicionado para tornar a coluna rolável
        child: Container(
          padding: const EdgeInsets.fromLTRB(14, 16, 14, 16),
          child: Column(children: [
            AchievementsWidget(),
            const SizedBox(height: 24),
            Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 16.0), // Exclusive padding for this instance
                child: CustomRichTextWidget(),
            ),
            UserProfileWidget(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder:(context) => ChildMonitoring(pagePosition: pagePosition, name: "Caio", age: 10, level: 3)));
              } ,
              name: "Caio",
              age: 10,
              completedTrails: 14,
              level: 3,
              userPhotoPath: "assets/images/appImages/ianzinho.jpg",
            ),
          ]),
        ),
      ),
    );
  }
}
