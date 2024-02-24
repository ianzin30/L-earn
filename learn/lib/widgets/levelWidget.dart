import 'package:flutter/material.dart';
import '/utils/animatedProgressBar.dart';
import '/utils/levelBarUtils.dart';

class LevelWidget extends StatelessWidget {
  final int pontuation;
  final String mascotName;

  LevelWidget({
    required this.pontuation,
    required this.mascotName
  });

    @override
  Widget build(BuildContext context) {
    final currentLevel = getValues();
    final nextLevelPontuation = levelsPontuations.keys.firstWhere(
      (k) => k > pontuation,
      orElse: () => pontuation,
    );
    final List<Color> defaultGradientCollors = [Colors.white,Colors.white];
    final List<Color> collorsGradients = defaultGradientCollors;
    final Color fontCollor =  Color(0xFF040862);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: collorsGradients,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(25), // Arredondamento das bordas
        boxShadow: [
          BoxShadow(
            color: fontCollor,
            spreadRadius: 2.5,
            blurRadius: 8,
            offset: Offset(0,0),
          )
        ]
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children : [
            Column( // Texto do nome, nível e XP
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
                children : [
                  Text(
                    mascotName,
                    style: TextStyle(color: fontCollor, fontSize: 18),
                  ),
                  Text(
                    '${currentLevel['level']} ${currentLevel['class']}',
                    style: TextStyle(color: fontCollor, fontSize: 16),
                  ),
                  Text(
                    '$pontuation / $nextLevelPontuation XP',
                    style: TextStyle(color: fontCollor, fontSize: 10),
                  ),
                ],
            ),
            const SizedBox(height: 8),
            Stack(
              alignment: Alignment.center,
              children: [
                 Center(
                   child: Image.asset(
                     'assets/images/appIcons/progressFieldWithStarsBlue.png',
                     width: 72,
                   ),
                 ),
                 Container(
                    padding: const EdgeInsets.only(bottom: 5), 
                    child: Text(
                     '${currentLevel['class']}',
                     style: TextStyle(color: Color(0xFF040862), fontSize:32),
                    )
                 )
              ],
          ),
          ],
          ),
          
          const SizedBox(height: 8),
            AnimatedProgressBar(
              progress: pontuation.floorToDouble(), 
              maxProgress: nextLevelPontuation.floorToDouble(),
              barColor: Color(0xFF040862),
            ),
        ],
      ),
    );
  }

  Map<String, dynamic> getValues() {
    int selected = 0;
    levelsPontuations.keys.forEach((value) {
      if (value <= pontuation && value >= selected) {
        selected = value;
      }
    });
    return levelsPontuations[selected] ?? {'level': 'Bronze', 'class': 'I'};
  }
}