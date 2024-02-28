import 'package:flutter/material.dart';
import '../../widgets/global/learnAppBar.dart';
import 'package:learn/widgets/levelWidget.dart';
import 'package:learn/widgets/StreakWidget.dart';
import 'package:learn/widgets/activitiesWidgets/activitieContentColumn.dart';
import 'package:learn/widgets/loginWidgets/trilhaSoldi.dart';
import '/widgets/achivievementWidget.dart';

class ChildrenHomePage extends StatelessWidget {
  final ValueNotifier<double> pagePosition;

  const ChildrenHomePage({required this.pagePosition, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final statusBarHeight = MediaQuery.of(context).padding.top;

    const userName = 'Ian Braga';

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
              child :Column(
                children: [ 
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      // Nesting Rows to keep the image and text together
                      children: [
                        const SizedBox(width: 20), // Adjust the space as needed
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset(
                              'assets/images/appImages/ianzinho.jpg',
                              height: 60),
                        ),
                        const SizedBox(width: 8), // Adjust the space as needed
                        RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: 'Seja bem-vindo,\n',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontFamily: "Fieldwork-Geo",
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              TextSpan(
                                text: userName,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: "Fieldwork-Geo",
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    const StreakWidget(streakDays: 20),

                    Icon(Icons.account_circle,
                        color: Colors.white
                            .withOpacity(0.0)), // Invisible icon for alignment
                  ],
                ),
              ],
              ) ,
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
