class Card {
  late int id;
  late String definition;
  late String term;

  Card({required this.id, required this.definition, required this.term});

  Card.fromMap(Map data) {
    id = data["id"];
    definition = data["definition"];
    term = data["definition"];
  }
}
