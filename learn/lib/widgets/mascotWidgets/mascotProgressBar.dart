import 'package:flutter/material.dart';
import '/widgets/animatedProgressBar.dart';

class MascotProgressBar extends StatelessWidget {
  final int pontuation;
  final String mascotName;

  MascotProgressBar({
    required this.pontuation,
    required this.mascotName
  });

  final Map<int, Map<String, dynamic>> levelsPontuations = {
    0     : {'level' : 'Bronze', 'class' : 'I'  },
    200   : {'level' : 'Bronze', 'class' : 'II' },
    500   : {'level' : 'Bronze', 'class' : 'III'},
    1000  : {'level' : 'Prata' , 'class' : 'I'  },
    2000  : {'level' : 'Prata' , 'class' : 'II' },
    4000  : {'level' : 'Prata' , 'class' : 'III'},
    6000  : {'level' : 'Ouro'  , 'class' : 'I'  },
    8000  : {'level' : 'Ouro'  , 'class' : 'II' },
    10000 : {'level' : 'Ouro'  , 'class' : 'III'}
  };

  final Map<String, List<Color>> boxesCollors = {
    'Bronze' : [ const Color(0xFFFFD0AE),const Color(0xFFBF5100),const Color(0xFF562400) ],
    'Prata'  : [const Color(0xFFD9D9D9),const Color(0xFF848484),const Color(0xFF49454F) ],
    'Ouro'   : [const Color(0xFFFFF3AF),const Color(0xFFDDC235), const Color(0xFFD07904)]
  };

  final Map<String, Color> levelColors = {
    'Bronze': const Color(0xFF562400),
    'Prata' : const Color(0xFF49454F),
    'Ouro'  : const Color(0xFFD07904),
  };


    @override
  Widget build(BuildContext context) {
    final currentLevel = getValues();
    //final progressColor = levelColors[currentLevel['level']] ?? Colors.blue;
    final progressColor = Colors.white ?? Colors.blue;
    final nextLevelPontuation = levelsPontuations.keys.firstWhere(
      (k) => k > pontuation,
      orElse: () => pontuation,
    );
    var progress = pontuation / nextLevelPontuation;
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