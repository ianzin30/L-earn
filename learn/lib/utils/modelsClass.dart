import 'package:flutter/material.dart';

class AcheivmentsDate {
  DateTime date;
  int id;
  AcheivmentsDate({required this.date, required this.id});
}

class Children {
  String name;
  String photoPath;
  DateTime birthdate;
  int pontuation;
  DateTime? lastAccsess;
  final List<String> goals;
  final List<List<int>> activities;
  final List<AcheivmentsDate> acheivments;
  int lastActivitie;

  Children({
    required this.name,
    required this.birthdate,
    this.photoPath = "assets/images/appImages/ianzinho.jpg",
    this.pontuation = 0,
    this.activities = const [],
    this.goals = const [],
    this.acheivments = const [],
    this.lastAccsess,
    this.lastActivitie = 0
  });
}

class Parents {
  String name;
  String photoPath;
  final List<Children> dependents;

  Parents({
    required this.name,
    this.photoPath = "assets/images/appImages/ianzinho.jpg",
    this.dependents = const [],
  });
}

Children luciano = Children(
    name: "Luciano",
    birthdate: DateTime(2012, 11, 4),
    pontuation: 1200,
    photoPath: "assets/images/appImages/luciano.png",
    lastAccsess: DateTime(2024, 02, 28),
    acheivments: [
      AcheivmentsDate(date: DateTime(2024, 01, 12), id: 1),
      AcheivmentsDate(date: DateTime(2024, 01, 12), id: 2),
      AcheivmentsDate(date: DateTime(2024, 01, 12), id: 3)
    ],
    activities: [
        [],
        []
      ]
    );

Parents joana = Parents(
    name: "Joana Dias",
    dependents: [luciano],
    photoPath: "assets/images/appImages/joana-dias.png");

int diffYears(DateTime birthDate) {
  DateTime now = DateTime.now();
  int years = now.year - birthDate.year;
  if (now.month < birthDate.month ||
      (now.month == birthDate.month && now.day < birthDate.day)) {
    years--;
  }
  return years;
}

int diffDays(DateTime date) {
  DateTime now = DateTime.now();
  return now.difference(date).inDays;
}

class Lession{
  final int id;
  final String title;
  final String description;
  Widget? page;

  Lession({
    required this.id,
    required this.title,
    required this.description,
    this.page,
  });
}

class Activitie{
  final int id;
  final String title;
  final String description;
  final String pageTitle;
  final String pageDescription;
  final int level;
  final List<Color> backgroundColors;
  final List<Lession> lessionsList;

  Activitie({
    required this.id,
    required this.title,
    required this.description,
    this.pageTitle = "",
    this.pageDescription = "",
    this.lessionsList = const [],
    this.level = 1,
    this.backgroundColors = const [Color(0XFF1290A2),Color(0xFF82DA59)],
  });
}