import 'package:flutter/material.dart';
import '../../widgets/global/appBar.dart';
import 'package:learn/widgets/levelWidget.dart';
import 'package:learn/widgets/StreakWidget.dart';


class ChildrenHomePage extends StatelessWidget {
  final ValueNotifier<double> pagePosition;

  const ChildrenHomePage({required this.pagePosition, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final statusBarHeight = MediaQuery.of(context).padding.top;

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      // Nesting Rows to keep the image and text together
                      children: [
                        SizedBox(width: 20), // Adjust the space as needed
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset(
                              'assets/images/appImages/ianzinho.jpg',
                              height: 60),
                        ),
                        const SizedBox(width: 8), // Adjust the space as needed
                        const Text('Atividades',
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    const SizedBox(width: 60), // Adjust the space as needed
                    const StreakWidget(streakDays: 20),
                    // Placeholder or icon on the right
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
            top: screenHeight / 2,
            left: 0,
            right: 0,
            child: Column(
              children: const [
                Text('Página da Home das Crianças'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
