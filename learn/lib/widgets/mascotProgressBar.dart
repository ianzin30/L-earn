import 'package:flutter/material.dart';

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
    3000  : {'level' : 'Prata' , 'class' : 'III'},
    4500  : {'level' : 'Ouro'  , 'class' : 'I'  },
    7000  : {'level' : 'Ouro'  , 'class' : 'II' },
    10000 : {'level' : 'Ouro'  , 'class' : 'III'}
  };

  final Map<String, List<Color>> boxesCollors = {
    'Bronze' : [const Color(0xFF562400),const Color(0xFFBF5100), const Color(0xFFFFD0AE)],
    'Prata'  : [const Color(0xFF49454F),const Color(0xFF848484), const Color(0xFFD9D9D9)],
    'Ouro'   : [const Color(0xFFD07904),const Color(0xFFDDC235), const Color(0xFFFFF3AF)]
  };

  final Map<String, Color> levelColors = {
    'Bronze': const Color(0xFFBF5100),
    'Prata' : const Color(0xFF848484),
    'Ouro'  : const Color(0xFFDDC235),
  };

    @override
  Widget build(BuildContext context) {
    var currentLevel = getValues();
    var progressColor = levelColors[currentLevel['level']] ?? Colors.blue;
    var nextLevelPontuation = levelsPontuations.keys.firstWhere(
      (k) => k > pontuation,
      orElse: () => pontuation,
    );
    var progress = pontuation / nextLevelPontuation;
    final List<Color> defaultGradientCollors = [const Color(0xFF7A7FFF),const Color(0xFF040862)];
    final List<Color> collorsGradients = boxesCollors[currentLevel['level']] ?? defaultGradientCollors;

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
          Text(
            mascotName,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          Text(
            '${currentLevel['level']} ${currentLevel['class']}',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          Text(
            '$pontuation / $nextLevelPontuation XP',
            style: TextStyle(color: Colors.white, fontSize: 10),
          ),
          SizedBox(height: 8),
          LinearProgressIndicator(
            value: progress,
            backgroundColor: progressColor.withAlpha(50),
            valueColor: AlwaysStoppedAnimation<Color>(progressColor),
          ),
          SizedBox(height: 8),
          Row(
            children: [
            ],
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