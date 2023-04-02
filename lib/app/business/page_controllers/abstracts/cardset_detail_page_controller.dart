import 'package:get/get.dart';
import 'package:quizlet_app/app/data/models/cardset.dart';

abstract class ICardsetDetailPageController {
  late Rx<Cardset> cardset;
  Rx<int> cardIndex = 0.obs;
  int? cardsetIndex;
  void init(int? cardsetIndex, Cardset cardset);
  void increaseCardIndex();
  void decreaseCardIndex();
}
