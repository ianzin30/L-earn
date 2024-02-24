import 'package:flutter/material.dart';
import '/widgets/animatedProgressBar.dart';
import '/utils/levelBarUtils.dart';

class MascotProgressBar extends StatelessWidget {
  final int pontuation;
  final String mascotName;

  MascotProgressBar({
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
    final List<Color> defaultGradientCollors = [const Color(0xFF7A7FFF),const Color(0xFF040862)];
    final List<Color> collorsGradients = boxesCollors[currentLevel['level']] ?? defaultGradientCollors;
    final Color fontCollor = levelColors[currentLevel['level']] ?? Colors.white;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: collorsGradients,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(25), // Arredondamento das bordas
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
                     'assets/images/appIcons/progressFieldWithStars.png',
                     width: 72,
                   ),
                 ),
                 Container(
                    padding: const EdgeInsets.only(bottom: 5), 
                    child: Text(
                     '${currentLevel['class']}',
                     style: TextStyle(color: Colors.white, fontSize:32),
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
              barColor: Colors.white,
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