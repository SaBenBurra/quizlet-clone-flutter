import 'package:get/get.dart';
import 'package:quizlet_app/app/data/models/cardset.dart';

abstract class ICardsetDetailPageController {
  late Rx<Cardset> currentlyShowingCardset;
  Rx<int> cardIndex = 0.obs;
  void increaseCardIndex();
  void decreaseCardIndex();
}
