import 'package:flutter/material.dart';
import 'package:learn/widgets/activitiesWidgets/activitieCardStatic.dart';
import 'package:learn/widgets/global/learnAppBar.dart';
import 'package:learn/widgets/activitiesWidgets/activitieContentColumn.dart';
import 'package:learn/utils/activitiesList.dart';
import 'package:learn/pages/activities/actitivitie_01/lession01/lession01Main.dart';

final activitie01List = [
  LessionCardStatic(
    level: 1, 
    title: "Ajude Coiny no shopping", 
    description: "Venha ajudar a Connie a ter as melhores decisões no shopping",
    isLocked: false,
    pageWidget: Lession01Main(),
  ),
  LessionCardStatic(
    level: 1, 
    title: "Ajude Coiny no shopping", 
    description: "Venha ajudar a Cony a ter as melhores decisões no shopping",
    backgroundGradientColors: const [Color(0XFFF59D4D),Color(0XFFF59D4D)],
  ),
  LessionCardStatic(
    level: 1, 
    title: "Ajude Coiny no shopping", 
    description: "Venha ajudar a Cony a ter as melhores decisões no shopping",
    backgroundGradientColors: const [Color(0XFF1290A2),Color(0xFF82DA59)],
  ),
];