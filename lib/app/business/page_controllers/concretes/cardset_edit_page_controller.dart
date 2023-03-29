import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizlet_app/app/business/page_controllers/abstracts/cardset_edit_page_controller.dart';
import 'package:quizlet_app/app/data/models/cardset.dart';

class CardsetEditPageController extends GetxController
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
  void onInit() {
    super.onInit();

    cardInputs.forEach((cardData) {
      definitionControllers
          .add(TextEditingController(text: cardData.keys.toList()[0]));
      termControllers
          .add(TextEditingController(text: cardData.values.toList()[0]));
    });
  }

  @override
  void setCardInputs(Cardset cardset) {
    cardset.cards?.forEach((card) {
      cardInputs.add({card.definition:card.term});
    });
    cardInputs = cardInputs;
  }
}
