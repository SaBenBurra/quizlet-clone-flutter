import 'package:flutter/material.dart' hide Card;
import 'package:get/get.dart';
import 'package:quizlet_app/app/business/page_controllers/abstracts/cardset_detail_page_controller.dart';
import 'package:quizlet_app/app/business/page_controllers/abstracts/cardset_edit_page_controller.dart';
import 'package:quizlet_app/app/data/models/card.dart';
import 'package:quizlet_app/app/data/models/cardset.dart';
import 'package:quizlet_app/app/data/services/abstracts/cardset_manager.dart';
import 'package:quizlet_app/routes/pages/cardset_edit_page.dart';

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
  ICardsetDetailPageController? cardsetDetailPageController;

  @override
  void init(Cardset cardset,
      ICardsetDetailPageController? cardsetDetailPageController) {
    this.cardset = cardset;
    for (var cardData in cardInputs) {
      definitionControllers
          .add(TextEditingController(text: cardData.keys.toList()[0]));
      termControllers
          .add(TextEditingController(text: cardData.values.toList()[0]));
    }
    cardsetNameInputController.text = cardset.name;

    this.cardsetDetailPageController = cardsetDetailPageController;
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

  void _updateCardset(String cardsetName, List<Map<String, String>> cardsData) {
    cardset.name = cardsetName;
    List<Card> cards = [];
    for (Map<String, String> cardData in cardsData) {
      Card card =
          Card(definition: cardData["definition"]!, term: cardData["term"]!);
      cards.add(card);
    }
    cardset.cards = cards;
  }

  @override
  void saveCardset() async {
    formKey.currentState!.save();
    List<Map<String, String>> cardsData = <Map<String, String>>[];
    String cardsetName = cardsetNameInputController.text;

    if (cardsetNameInputController.text.isEmpty) {
      Get.snackbar("Validation error", "Cardset name can't be empty",
          backgroundColor: Colors.red);
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
    bool success =
        await cardsetManager.updateCardset(cardset.id, cardsetName, cardsData);
    success
        ? Get.snackbar("Success!", "Saved successfully.",
            backgroundColor: Colors.green)
        : Get.snackbar("Server error", "error", backgroundColor: Colors.red);
    _updateCardset(cardsetName, cardsData);
    if (cardsetDetailPageController != null) {
      cardsetDetailPageController!.cardset.value = cardset;
    }
  }
}
