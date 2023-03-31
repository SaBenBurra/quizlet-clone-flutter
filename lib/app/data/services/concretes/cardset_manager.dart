import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:quizlet_app/app/data/models/cardset.dart';
import 'package:quizlet_app/app/data/providers/api/abstracts/cardset_api_provider.dart';
import 'package:quizlet_app/app/data/services/abstracts/cardset_manager.dart';

class CardsetGetxManager extends GetxController implements ICardsetManager {
  @override
  Map<int, Cardset> cardsets = <int, Cardset>{}.obs;
  @override
  Rx<Cardset>? currentlyShowingCardset = Cardset(id: 0, name: "").obs;

  final ICardsetApiProvider cardsetApiProvider = Get.find();

  @override
  void getAll() async {
    Response response = await cardsetApiProvider.getAll();
    var data = response.data["data"];
    Map<int, Cardset> fetchedCardsets = {};

    for (var cardsetData in data) {
      Cardset cardset =
          Cardset(id: cardsetData["id"], name: cardsetData["name"]);
      cardset.cardCount = cardsetData["cardCount"];
      fetchedCardsets[cardsetData["id"]] = cardset;
    }

    cardsets.assignAll(fetchedCardsets);
  }

  @override
  void updateCardset(
      int cardId, String cardsetName, List<Map<String, String>> cardsData) async {
    try {
      Response response =
          await cardsetApiProvider.update(cardId, cardsetName, cardsData);
    } on DioError catch (e) {
      print(e.response!.data.toString());
    }
  }
}
