import 'package:get/get.dart';
import 'package:quizlet_app/app/data/models/cardset.dart';

abstract class ICardsetDetailPageController {
  late Rx<Cardset> cardset;
  Rx<int> cardIndex = 0.obs;
  int? cardsetIndex;
  int? tabId;
  void init({int? cardsetIndex, required Cardset cardset, int? tabId});
  void increaseCardIndex();
  void decreaseCardIndex();
  void removeButtonAction(); 
  void editButtonAction();
}
