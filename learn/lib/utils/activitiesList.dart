import 'package:flutter/material.dart';
import 'package:learn/widgets/activitiesWidgets/activitieCardStatic.dart';

List<ActivitieCardStatic> activitiesList = [
   ActivitieCardStatic(
    level: 1,
    title: "Orçamento para um passeio", 
    description:  "Continue onde parou",
    progress: 50.0,
    isLocked: false,
    backgroundGradientColors: const  [Color(0XFF7A7FFF),Color(0xFF040862)],
    levelGradientColors: [Colors.white.withOpacity(0.3), Colors.white.withOpacity(0.01)],
  ),
   ActivitieCardStatic(
    level: 1,
    title: "Orçamento para um passeio", 
    description:  "Continue onde parou",
    progress: 0.0,
    isLocked: true,
    backgroundGradientColors: const  [Color(0XFF1290A2),Color(0xFF82DA59)],
    levelGradientColors: [Colors.white.withOpacity(0.8), Colors.white.withOpacity(0.2)],
  ),
  ActivitieCardStatic(
    level: 2,
    title: "Orçamento para um passeio", 
    description:  "Continue onde parou",
    progress: 0.0,
    isLocked: true,
    backgroundGradientColors: const  [Color(0XFFF59D4D),Color(0XFFF59D4D)],
    levelGradientColors: [Colors.white.withOpacity(0.8), Colors.white.withOpacity(0.2)],
  )
];