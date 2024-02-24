
import 'package:flutter/material.dart';

const Map<int, Map<String, dynamic>> levelsPontuations = {
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

const  Map<String, List<Color>> boxesCollors = {
  'Bronze' : [Color(0xFFFFD0AE), Color(0xFFBF5100), Color(0xFF562400) ],
  'Prata'  : [Color(0xFFD9D9D9), Color(0xFF848484), Color(0xFF49454F) ],
  'Ouro'   : [Color(0xFFFFF3AF), Color(0xFFDDC235), Color(0xFFD07904)]
};

const Map<String, Color> levelColors = {
  'Bronze':  Color(0xFF562400),
  'Prata' :  Color(0xFF49454F),
  'Ouro'  :  Color(0xFFD07904),
};