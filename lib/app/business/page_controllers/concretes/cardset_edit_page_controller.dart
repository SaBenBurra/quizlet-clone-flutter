import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizlet_app/app/business/page_controllers/abstracts/cardset_edit_page_controller.dart';
import 'package:quizlet_app/app/data/models/cardset.dart';
import 'package:quizlet_app/app/data/services/abstracts/cardset_manager.dart';

class CardsetEditPageGetxController extends GetxController
    implements ICardsetEditPageController {
  @override
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  List<Map<String, String>> cardInputs = <Map<String, String>>[].obs;

  @override
  List<TextEditingController> definitionControllers = [];

  @override
  List<TextEditingController> termControllers = [];

  @override
  TextEditingController cardsetNameInputController = TextEditingController();
  

  ICardsetManager cardsetManager = Get.find();
  late Cardset cardset;

  @override
  void init(Cardset cardset) {
    this.cardset = cardset;
    for (var cardData in cardInputs) {
      definitionControllers
          .add(TextEditingController(text: cardData.keys.toList()[0]));
      termControllers
          .add(TextEditingController(text: cardData.values.toList()[0]));
    }
    cardsetNameInputController.text = cardset.name;
  }

  @override
  void setCardInputs(Cardset cardset) {
    cardInputs = <Map<String, String>>[].obs;
    cardset.cards?.forEach((card) {
      cardInputs.add({card.definition: card.term});
    });
    cardInputs = cardInputs;
  }

  @override
  void addNewInputField() {
    if (definitionControllers.last.text.trim().isNotEmpty &&
        termControllers.last.text.trim().isNotEmpty) {
      definitionControllers.add(TextEditingController());
      termControllers.add(TextEditingController());
      cardInputs.add({"": ""});
    }
  }

  @override
  void saveCardset() {
    formKey.currentState!.save();
    List<Map<String, String>> cardsData = <Map<String, String>>[];

    if(cardsetNameInputController.text.isEmpty) {
      Get.snackbar("Validation error", "Cardset name can't be empty", backgroundColor: Colors.red);
      return;
    }
    for (int index = 0; index < cardInputs.length; index++) {
      String definition = definitionControllers[index].text.trim();
      String term = termControllers[index].text.trim();
      if ((definition.isNotEmpty && term.isEmpty) ||
          (definition.isEmpty && term.isNotEmpty)) {
        Get.snackbar("Validation error", "There is an empty field",
            backgroundColor: Colors.red);
        return;
      }
      if (definition.isEmpty && term.isEmpty) continue;
      cardsData.add({"definition": definition, "term": term});
    }
    cardsetManager.updateCardset(cardset.id, cardsetNameInputController.text, cardsData);
    Get.snackbar("Success!", "Saved successfully.", backgroundColor: Colors.green);
  }

}
