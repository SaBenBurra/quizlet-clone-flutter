import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizlet_app/app/business/page_controllers/abstracts/cardset_list_page_controller.dart';
import 'package:quizlet_app/app/data/models/cardset.dart';
import 'package:quizlet_app/app/data/services/abstracts/cardset_manager.dart';
import 'package:quizlet_app/utils/screen_size.dart';

class CardsetListPageGetxController extends GetxController
    implements ICardsetListPageController {
  @override
  List<Cardset> cardsets = <Cardset>[].obs;
  ICardsetManager cardsetManager = Get.find();
  TextEditingController newCardsetNameInputController = TextEditingController();

  @override
  Future<List<Cardset>> getCardsets() async {
    await cardsetManager.getAll();
    cardsets.assignAll(cardsetManager.cardsets.values.toList());
    return cardsets;
  }

  @override
  void createButtonAction() {
    ScreenSize screenSize = Get.find();
    Get.defaultDialog(
        title: "Create new cardset",
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: newCardsetNameInputController,
            ),
            SizedBox(
              height: screenSize.height * .04,
            ),
            TextButton(onPressed: createCardset, child: const Text("create"))
          ],
        ));
  }

  @override
  void createCardset() async {
    ScreenSize screenSize = Get.find();

    Get.dialog(
        Center(
            child: SizedBox(
                width: screenSize.width * .08,
                height: screenSize.width * .08,
                child: CircularProgressIndicator())),
        barrierDismissible: false);
    if (newCardsetNameInputController.text.isNotEmpty) {
      cardsetManager
          .create(newCardsetNameInputController.text.trim())
          .then((value) {
        getCardsets();
        Get.back();
        Get.back();
        value
            ? Get.snackbar("Success!", "Successfully created.",
                backgroundColor: Colors.green)
            : Get.snackbar("Error", "Process failed",
                backgroundColor: Colors.red);
      });
    }
  }
}
