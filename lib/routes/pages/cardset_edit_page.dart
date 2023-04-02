import 'package:flutter/material.dart' hide Card;
import 'package:get/get.dart';
import 'package:quizlet_app/app/business/page_controllers/abstracts/cardset_detail_page_controller.dart';
import 'package:quizlet_app/app/business/page_controllers/abstracts/cardset_edit_page_controller.dart';
import 'package:quizlet_app/app/business/page_controllers/concretes/cardset_edit_page_controller.dart';
import 'package:quizlet_app/app/constants/color_constants.dart';
import 'package:quizlet_app/app/data/models/cardset.dart';
import 'package:quizlet_app/utils/screen_size.dart';
import 'package:quizlet_app/widgets/custom_text_form_field.dart';

class CardsetEditPage extends StatelessWidget {
  CardsetEditPage(
      {super.key, required this.cardset, this.cardsetDetailPageController});

  Cardset cardset;
  ICardsetDetailPageController? cardsetDetailPageController;
  ICardsetEditPageController cardsetEditPageController =
      Get.put(CardsetEditPageGetxController(), tag: UniqueKey().toString());
  final ScreenSize screenSize = Get.find();

  void init() {
    cardsetEditPageController.setCardInputs(cardset);
    cardsetEditPageController.init(cardset, cardsetDetailPageController);
  }

  @override
  Widget build(BuildContext context) {
    init();
    return Scaffold(
      floatingActionButton: Column(mainAxisSize: MainAxisSize.min, children: [
        buildSaveButton(),
        SizedBox(height: screenSize.height * .03),
        buildAddButton(),
      ]),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorConstants.darkBackgroundColor,
      ),
      backgroundColor: ColorConstants.darkBackgroundColor,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(screenSize.width * .05),
            child: buildCustomTextFormField(
                controller:
                    cardsetEditPageController.cardsetNameInputController,
                fontSize: screenSize.width * .06),
          ),
          Expanded(
            child: Form(
              key: cardsetEditPageController.formKey,
              child: Obx(() => ListView.builder(
                  itemCount: cardsetEditPageController.cardInputs.length,
                  itemBuilder: (context, index) {
                    return buildCardEditField(
                        cardsetEditPageController.definitionControllers[index],
                        cardsetEditPageController.termControllers[index]);
                  })),
            ),
          ),
        ],
      ),
    );
  }

  FloatingActionButton buildAddButton() {
    return FloatingActionButton(
      heroTag: "editButton",
      onPressed: cardsetEditPageController.addNewInputField,
      backgroundColor: Colors.grey,
      child: const Icon(Icons.add, color: Colors.black),
    );
  }

  FloatingActionButton buildSaveButton() {
    return FloatingActionButton(
      heroTag: "saveButton",
      onPressed: cardsetEditPageController.saveCardset,
      backgroundColor: Colors.grey,
      child: const Icon(Icons.save, color: Colors.black),
    );
  }

  Widget buildCardEditField(TextEditingController definitionController,
      TextEditingController termController) {
    return Container(
        color: ColorConstants.darkSixthAppColor,
        margin: EdgeInsets.symmetric(
            vertical: screenSize.height * .02,
            horizontal: screenSize.width * .05),
        width: screenSize.width * .85,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: screenSize.height * .03,
                  horizontal: screenSize.width * .05),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                buildCustomTextFormField(
                  controller: definitionController,
                ),
                SizedBox(
                  height: screenSize.height * .02,
                ),
                buildCustomTextFormField(
                  controller: termController,
                ),
              ]),
            ),
          ],
        ));
  }
}
