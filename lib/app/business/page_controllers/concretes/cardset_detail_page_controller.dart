import 'package:get/get.dart';
import 'package:quizlet_app/app/business/page_controllers/abstracts/cardset_detail_page_controller.dart';
import 'package:quizlet_app/app/data/models/cardset.dart';

class CardsetDetailPageController extends GetxController
    implements ICardsetDetailPageController {
  @override
  late Rx<Cardset> currentlyShowingCardset;
  @override
  Rx<int> cardIndex = 0.obs;

  @override
  void increaseCardIndex() {
    if (cardIndex < currentlyShowingCardset.value.cards!.length - 1) {
      cardIndex.value++;
    }
  }

  @override
  void decreaseCardIndex() {
    if (cardIndex > 0) cardIndex.value--;
  }
}
