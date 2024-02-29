import 'package:flutter/material.dart';
import '../../widgets/global/learnAppBar.dart';
import 'package:learn/widgets/levelWidget.dart';
import 'package:learn/widgets/StreakWidget.dart';
import 'package:learn/widgets/loginWidgets/trilhaSoldi.dart';
import '../../widgets/user-profile.dart';
import '/widgets/achivievementWidget.dart';

class ChildrenHomePage extends StatelessWidget {
  final ValueNotifier<double> pagePosition;

  const ChildrenHomePage({required this.pagePosition, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    const userName = 'Ian Braga';
    const userPhotoPath = 'assets/images/appImages/ianzinho.jpg';

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: LearnAppBar(
              pageIndex: 0,
              pagePosition: pagePosition.value,
              children: [
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const UserPhotoAndName(
                        userName: userName, userPhotoPath: userPhotoPath),
                    const Spacer(),
                    const StreakWidget(streakDays: 20),
                    Icon(Icons.account_circle,
                        color: Colors.white
                            .withOpacity(0.0)), // Invisible icon for alignment
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 150,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.fromLTRB(20.0, 22.0, 20.0, 10.0),
              child: LevelWidget(pontuation: 200, mascotName: "Pedro"),
            ),
          ),
          Positioned(
            top: screenHeight / 2.7,
            left: 0,
            right: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 14.0),
                  child: Text('Trilhas em andamento',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 16,
                        fontFamily: "Fieldwork-Geo",
                        fontWeight: FontWeight.w600,
                      )),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 14.0),
                  child: Text('Continue de onde parou.',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 12,
                        fontFamily: "Fieldwork-Geo",
                      )),
                ),
                ActivitieContentRow(),
                AchievementsWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
