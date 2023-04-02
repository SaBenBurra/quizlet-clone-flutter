import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizlet_app/app/business/page_controllers/abstracts/cardset_detail_page_controller.dart';
import 'package:quizlet_app/app/business/page_controllers/abstracts/cardset_list_page_controller.dart';
import 'package:quizlet_app/app/data/models/cardset.dart';
import 'package:quizlet_app/app/data/services/abstracts/cardset_manager.dart';
import 'package:quizlet_app/routes/pages/cardset_edit_page.dart';

class CardsetDetailPageGetxController extends GetxController
    implements ICardsetDetailPageController {
  @override
  late Rx<Cardset> cardset;
  @override
  Rx<int> cardIndex = 0.obs;

  @override
  int? cardsetIndex;

  int? tabId;

  ICardsetManager cardsetManager = Get.find();

  ICardsetListPageController cardsetListPageController =
      Get.find<ICardsetListPageController>();

  void updateCardset() {
    if (cardsetIndex != null) {
      cardsetListPageController.cardsets[cardsetIndex!] = cardset.value;
    }
  }

  @override
  void init({int? cardsetIndex, required Cardset cardset, int? tabId}) {
    this.cardset = cardset.obs;
    this.cardsetIndex = cardsetIndex;
    this.tabId = tabId;
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

  @override
  void editButtonAction() {
    Get.to(CardsetEditPage(
        cardset: cardset.value, cardsetDetailPageController: this));
  }

  @override
  void removeButtonAction() {
    Get.defaultDialog(
        title: "Are you sure?",
        content: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(onPressed: removeCardset, child: Text("Yes")),
            TextButton(onPressed: Get.back, child: Text("No"))
          ],
        ));
  }

  void removeCardset() async {
    bool success = await cardsetManager.removeCardset(cardset.value.id);
    if (!success) {
      Get.snackbar("Server Error", "Can't removed", backgroundColor: Colors.red);
      return;
    }
    if (cardsetIndex != null) {
      cardsetListPageController.cardsets.removeAt(cardsetIndex!);
    }
    Get.back();
    Get.back(id: tabId);
    Get.snackbar("Success!", "Successfully removed.", backgroundColor: Colors.green);
  }
}
