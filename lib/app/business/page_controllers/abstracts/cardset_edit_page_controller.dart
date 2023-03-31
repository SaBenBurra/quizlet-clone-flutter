import 'package:flutter/material.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:quizlet_app/app/data/models/cardset.dart';

abstract class ICardsetEditPageController {
  late GlobalKey<FormState> formKey;
  List<TextEditingController> definitionControllers = [];
  List<TextEditingController> termControllers = [];
  late TextEditingController cardsetNameInputController;
  void init(Cardset cardset);
  List<Map<String, String>> cardInputs = <Map<String, String>>[].obs;
  void setCardInputs(Cardset cardset);
  void addNewInputField();
  void saveCardset();
}
