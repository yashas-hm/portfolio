class Model {
  final String id;
  final String role;
  final String name;
  final String location;
  final DateTime from;
  final DateTime to;
  final List<String> description;
  final String link;
  final String linkName;
  final List<String> skills;

  Model({
    required this.id,
    required this.role,
    required this.name,
    required this.location,
    required this.from,
    required this.to,
    required this.description,
    required this.link,
    required this.skills,
    required this.linkName,
  });
}
