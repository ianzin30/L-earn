import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final DateTime now = DateTime.now();
final today = DateTime(now.year, now.month, now.day);

class AcheivmentsDate {
  DateTime date;
  int id;
  AcheivmentsDate({required this.date, required this.id});
}

class Children{
  String childrenCode;
  String name;
  String photoPath;
  DateTime birthdate;
  int pontuation;
  DateTime? lastAccsess;
  final List<String> goals;
  final List<List<int>> activities;
  final List<AcheivmentsDate> acheivments;
  int lastActivitie;
  final Map<DateTime, int> xpPerDay;

  Children({
    required this.childrenCode,
    required this.name,
    required this.birthdate,
    this.photoPath = "assets/images/appImages/ianzinho.jpg",
    this.pontuation = 0,
    this.activities = const [],
    this.goals = const [],
    this.acheivments = const [],
    this.lastAccsess,
    this.lastActivitie = 0,
    this.xpPerDay = const {},
  });

  Map<String, dynamic> getJson(){

    return {
      'name' : name,
      'birthdate' : Timestamp.fromDate(birthdate),
      'photoPath' : photoPath,
      'pontuation' : pontuation,
      'activities' : activities.map((e) => e.join()).toList(),
      'goals' : goals,
      'acheivments' :acheivments.map((e){
        return {
          'date' : Timestamp.fromDate(e.date),
          'id' : e.id,
        };
      }).toList(),
      'lastAccsess' : Timestamp.fromDate(lastAccsess?? today),
      'lastActivitie' : lastActivitie,
      'xpPerDay' : xpPerDay.entries.map((entry) {
       return {
         'date' : Timestamp.fromDate(entry.key),
         'xp' : entry.value,
       };
      },)
    };
  }

  Future<void> update() async {
  print("Funcao acionada");
  await FirebaseFirestore.instance
      .collection('children')
      .doc(childrenCode)
      .set(getJson())
      .catchError((error) => print('Erro ao adicionar documento: $error')); 
}

}

class VolatileChildren extends ValueNotifier<Children>{
  Children children;

  VolatileChildren({required this.children}) : super(children);

  void setChildren(Children children){
    this.children = children;
    notifyListeners();
  }

  void addPontuation(int value){
    children.pontuation += value;
    print(children.pontuation);
    children.xpPerDay.update(today, (existingValue) => existingValue + value, ifAbsent: () => value);
    children.update();
    notifyListeners();
  }

  void updateDB(){}
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
  childrenCode: "1111",
    name: "Luciano Dias",
    birthdate: DateTime(2010, 11, 4),
    pontuation: 1200,
    photoPath: "assets/images/appImages/luciano.png",
    lastAccsess: DateTime(2024, 02, 28),
    acheivments: [
      AcheivmentsDate(date: DateTime(2024, 01, 12), id: 1),
      AcheivmentsDate(date: DateTime(2024, 01, 12), id: 2),
      AcheivmentsDate(date: DateTime(2024, 01, 12), id: 3)
    ],
    activities: [
        [0],
        [],
      ],
    xpPerDay: {
      today.subtract(const Duration(days: 7)) : 100,
      today.subtract(const Duration(days: 6)) : 200,
      today.subtract(const Duration(days: 5)) : 400,
      today.subtract(const Duration(days: 4)) : 100,
      today.subtract(const Duration(days: 3)) : 20,
      today.subtract(const Duration(days: 2)) : 100,
      today.subtract(const Duration(days: 1)) : 160,
      today.subtract(const Duration(days: 0)) : 100,
    }
);

//VolatileChildren childUser = VolatileChildren(children: luciano);

Children carlos = Children(
  childrenCode: "2222",
    name: "Carlos Dias",
    birthdate: DateTime(2012, 11, 4),
    pontuation: 1600,
    photoPath: "assets/images/appImages/carlos-dias.png",
    lastAccsess: DateTime(2024, 02, 28),
    acheivments: [
      AcheivmentsDate(date: DateTime(2024, 01, 12), id: 1),
      AcheivmentsDate(date: DateTime(2024, 01, 12), id: 2),
      AcheivmentsDate(date: DateTime(2024, 01, 12), id: 3)
    ],
    activities: [
        [0],
        [],
      ],
    xpPerDay:{
      today.subtract(const Duration(days: 7)) : 50,
      today.subtract(const Duration(days: 6)) : 100,
      today.subtract(const Duration(days: 5)) : 200,
      today.subtract(const Duration(days: 4)) : 100,
      today.subtract(const Duration(days: 3)) : 300,
      today.subtract(const Duration(days: 2)) : 120,
      today.subtract(const Duration(days: 1)) : 120,
      today.subtract(const Duration(days: 0)) : 80,
    }
);

Parents currentUser = Parents(
  name: FirebaseAuth.instance.currentUser?.email ?? "No name",
  photoPath: FirebaseAuth.instance.currentUser?.photoURL ??
      "assets/images/appImages/ianzinho.jpg",
  dependents: [luciano], // Add the children of the current user here
  );

Parents joana = Parents(
    name: "Joana Dias",
    dependents: [luciano, carlos],
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

class Lession {
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

class Activitie {
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
    this.backgroundColors = const [Color(0XFF1290A2), Color(0xFF82DA59)],
  });
}
