import 'package:get/get.dart';
import 'package:quizlet_app/app/data/models/cardset.dart';

abstract class ICardsetManager {
  Map<int, Cardset> cardsets = <int, Cardset>{}; 
  Rx<Cardset>? currentlyShowingCardset;
  Future<void> getAll();   
  Future<bool> create(String cardsetName);
  Future<bool> updateCardset(int cardsetId, String cardsetName, List<Map<String, String>> cards);
  Future<bool> removeCardset(int cardsetId);
}
