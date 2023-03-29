import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:quizlet_app/app/data/models/card.dart';
import 'package:quizlet_app/app/data/providers/api/abstracts/card_api_provider.dart';
import 'package:quizlet_app/app/data/services/abstracts/card_manager.dart';

class CardGetxManager implements ICardManager {
  final ICardApiProvider cardApiProvider = Get.find();
  @override
  Future<List<Card>> getCardsByCardsetId(int cardsetId) async {
    Response response = await cardApiProvider.getByCardsetId(cardsetId);

    var data = response.data["data"];
    List<Card> cards = [];

    for (var cardData in data) {
      Card card = Card(
          id: cardData["id"], definition: cardData["definition"], term: cardData["term"]);
      cards.add(card);
    }

    return cards;
  }
}
