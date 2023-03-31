import 'package:get/get.dart';
import 'package:quizlet_app/app/data/models/cardset.dart';

abstract class ICardsetManager {
  Map<int, Cardset> cardsets = <int, Cardset>{}; 
  Rx<Cardset>? currentlyShowingCardset;
  void getAll();   
  void updateCardset(int cardId, String cardsetName, List<Map<String, String>> cards);
}
