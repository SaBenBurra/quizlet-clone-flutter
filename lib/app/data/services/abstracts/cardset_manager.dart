import 'package:get/get.dart';
import 'package:quizlet_app/app/data/models/cardset.dart';

abstract class ICardsetManager {
  Map<int, Cardset> cardsets = <int, Cardset>{}; 
  Rx<Cardset>? currentlyShowingCardset;
  Future<void> getAll();   
  Future<bool> updateCardset(int cardId, String cardsetName, List<Map<String, String>> cards);
}
