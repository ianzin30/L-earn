
import 'package:flutter/material.dart';

const Map<int, Map<String, String>> levelsPontuations = {
  0     : {'level' : 'Bronze', 'class' : 'I'  },
  200   : {'level' : 'Bronze', 'class' : 'II' },
  500   : {'level' : 'Bronze', 'class' : 'III'},
  1000  : {'level' : 'Prata' , 'class' : 'I'  },
  2000  : {'level' : 'Prata' , 'class' : 'II' },
  4000  : {'level' : 'Prata' , 'class' : 'III'},
  6000  : {'level' : 'Ouro'  , 'class' : 'I'  },
  8000  : {'level' : 'Ouro'  , 'class' : 'II' },
  10000 : {'level' : 'Ouro'  , 'class' : 'III'},
  12000 : {'level' : 'Diamante', 'class' : 'I'  },
  14000 : {'level' : 'Diamante', 'class' : 'II' },
  16000 : {'level' : 'Diamante', 'class' : 'III'}
};

const  Map<String, List<Color>> boxesCollors = {
  'Bronze' : [Color(0xFFE3834F), Color(0xFF75250C) ],
  'Prata'  : [Color(0xFFB0B0B0), Color(0xFF4C4C4C)],
  'Ouro'   : [Color(0xFFE6BB4B), Color(0xFFAF500B)],
  "Diamante" : [Color(0xFF4B9CE6) , Color(0xFF0E0C82)]
};

const Map<String, Color> levelColors = {
  'Bronze':  Color(0xFFFFFFFF),
  'Prata' :  Color(0xFFFFFFFF),
  'Ouro'  :  Color(0xFFFFFFFF),
  "Diamante" :  Color(0xFFFFFFFF)
};