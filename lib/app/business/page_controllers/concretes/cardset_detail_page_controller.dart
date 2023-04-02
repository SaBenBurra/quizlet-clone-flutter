import 'package:get/get.dart';
import 'package:quizlet_app/app/business/page_controllers/abstracts/cardset_detail_page_controller.dart';
import 'package:quizlet_app/app/business/page_controllers/abstracts/cardset_list_page_controller.dart';
import 'package:quizlet_app/app/data/models/cardset.dart';

class CardsetDetailPageGetxController extends GetxController
    implements ICardsetDetailPageController {
  @override
  late Rx<Cardset> cardset;
  @override
  Rx<int> cardIndex = 0.obs;

  @override
  int? cardsetIndex;

  void updateCardset() {
    ICardsetListPageController cardsetListPageController =
        Get.find<ICardsetListPageController>();
    if (cardsetIndex != null) {
      cardsetListPageController.cardsets[cardsetIndex!] = cardset.value;
    }
  }

  @override
  void init(int? cardsetIndex, Cardset cardset) {
    this.cardset = cardset.obs;
    this.cardsetIndex = cardsetIndex;
    ever(this.cardset, (callback) {
      updateCardset();
    });
  }

  @override
  void increaseCardIndex() {
    if (cardIndex < cardset.value.cards!.length - 1) {
      cardIndex.value++;
    }
  }

  @override
  void decreaseCardIndex() {
    if (cardIndex > 0) cardIndex.value--;
  }
}
