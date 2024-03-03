import 'package:flutter/material.dart';
import '../../widgets/global/learnAppBar.dart';
import 'package:learn/widgets/StreakWidget.dart';
import 'package:learn/widgets/user-profile.dart';
import 'package:learn/widgets/globalProgressWidget.dart';


class ParentsHPage extends StatelessWidget {
  final ValueNotifier<double> pagePosition;

  ParentsHPage({
    required this.pagePosition
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LearnAppBarSuper(
        superHeigth: 320,
        superWidget: GlobalProgress(pontuation: 100, isMascot: false,),
        pageIndex: 1,
        pagePosition: pagePosition.value,
        child: Container(
          padding: const  EdgeInsets.fromLTRB(14, 16, 14, 0),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              UserPhotoAndName(
                userName: "Ian Braga",
                userPhotoPath: "assets/images/appImages/ianzinho.jpg",
                firstLine: "Seja bem-vindo,\n",
                fontWeight1: FontWeight.w400,
                secondLine: "Ian Braga",
                fontWeight2: FontWeight.bold,
              ),
              StreakWidget(streakDays: 7),
            ]
          )
        ),
      ),
      body: const Center(
        child: Text('Home Page dos Pais'),
      ),
    );
  }
}
