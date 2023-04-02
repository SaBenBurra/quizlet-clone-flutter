import 'package:flutter/material.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:quizlet_app/app/business/page_controllers/abstracts/cardset_detail_page_controller.dart';
import 'package:quizlet_app/app/business/page_controllers/abstracts/cardset_list_page_controller.dart';
import 'package:quizlet_app/app/data/models/cardset.dart';

abstract class ICardsetEditPageController {
  late GlobalKey<FormState> formKey;
  List<TextEditingController> definitionControllers = [];
  List<TextEditingController> termControllers = [];
  late TextEditingController cardsetNameInputController;
  void init(
      {required Cardset cardset,
      ICardsetDetailPageController? cardsetDetailPageController,
      ICardsetListPageController? cardsetListPageController, int? cardsetIndex});
  List<Map<String, String>> cardInputs = <Map<String, String>>[].obs;
  void setCardInputs(Cardset cardset);
  void addNewInputField();
  void saveCardset();
  void removeInputField(int index);
}
