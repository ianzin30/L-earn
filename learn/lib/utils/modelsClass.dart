class Children {
  String name;
  String photoPath;
  DateTime birthdate;
  int pontuation;
  DateTime? lastAccsess;
  final List<String> goals;
  final List<String> trails;

  Children({
    required this.name,
    required this.birthdate,
    this.photoPath = "assets/images/appImages/ianzinho.jpg",
    this.pontuation = 0,
    this.trails = const [],
    this.goals = const [],
    this.lastAccsess
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

Children luciano  = Children(
  name : "Luciano Dias",
  birthdate : DateTime(2012, 11, 4),
  pontuation: 1200,
  photoPath: "assets/images/appImages/luciano.png",
  lastAccsess: DateTime(2024, 02, 28)
);

Parents joana = Parents(
  name: "Joana Dias",
  dependents: [luciano],
  photoPath: "assets/images/appImages/joana-dias.png"
);

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