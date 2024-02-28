class Children {
  final String name;
  final String birthdate;
  final int pontuation;
  final List<String> goals;
  final List<String> trails;

  Children({
    required this.name,
    required this.birthdate,
    this.pontuation = 0,
    this.trails = const [],
    this.goals = const [],
});
}