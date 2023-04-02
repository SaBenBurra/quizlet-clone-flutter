class Card {
  int? id;
  late String definition;
  late String term;

  Card({this.id, required this.definition, required this.term});

  Card.fromMap(Map data) {
    id = data["id"];
    definition = data["definition"];
    term = data["definition"];
  }
}
