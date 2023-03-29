import 'package:quizlet_app/app/data/models/card.dart';

class Cardset {
  int id;
  String name;
  List<Card>? cards;

  int cardCount = 0;

  Cardset({required this.id, required this.name, this.cards});

  void updateCards(List<Card> cards) {
    this.cards = cards;
    cardCount = cards.length;
  }
}
