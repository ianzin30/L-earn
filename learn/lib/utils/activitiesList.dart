import 'package:flutter/material.dart';
import 'package:learn/widgets/activitiesWidgets/activitieCardStatic.dart';
import 'package:learn/pages/activities/actitivitie_01/activitie01lessions.dart';
import 'package:learn/widgets/activitiesWidgets/activitieCardAnimated.dart';
import 'package:learn/pages/activities/actitivitie_01/lession01/lession01Main.dart';


List<ActivitieCardStatic> activitiesList = [
   ActivitieCardStatic(
    pageTitle: "Conteúdos das atividades",
    pageDescription: "Conheça as atividades",
    lessionsList: [
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
      ],
    level: 1,
    title: "Orçamento para um passeio", 
    description:  "Continue onde parou",
    progress: 50.0,
    isLocked: false,
    backgroundGradientColors: const [Color(0XFF1290A2),Color(0xFF82DA59)],
    levelGradientColors: [Colors.white.withOpacity(0.3), Colors.white.withOpacity(0.01)],
  ),
   ActivitieCardStatic(
    pageTitle: "Titulo da Atividade 2",
    pageDescription: "Descrição atividade 2",
    level: 1,
    title: "Orçamento para um passeio", 
    description:  "Continue onde parou",
    progress: 0.0,
    isLocked: true,
    backgroundGradientColors: const  [Color(0XFF1290A2),Color(0xFF82DA59)],
    levelGradientColors: [Colors.white.withOpacity(0.8), Colors.white.withOpacity(0.2)],
  ),
  ActivitieCardStatic(
    pageTitle: "Titulo da Atividade 2",
    pageDescription: "Descrição atividade 2",
    level: 2,
    title: "Orçamento para um passeio", 
    description:  "Continue onde parou",
    progress: 0.0,
    isLocked: true,
    backgroundGradientColors: const  [Color(0XFFF59D4D),Color(0XFFF59D4D)],
    levelGradientColors: [Colors.white.withOpacity(0.8), Colors.white.withOpacity(0.2)],
  )
];
