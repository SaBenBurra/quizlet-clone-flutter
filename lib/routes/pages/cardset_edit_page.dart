import 'package:flutter/material.dart' hide Card;
import 'package:get/get.dart';
import 'package:quizlet_app/app/business/page_controllers/abstracts/cardset_edit_page_controller.dart';
import 'package:quizlet_app/app/constants/color_constants.dart';
import 'package:quizlet_app/app/data/models/cardset.dart';
import 'package:quizlet_app/utils/screen_size.dart';
import 'package:quizlet_app/widgets/custom_text_form_field.dart';

class CardsetEditPage extends StatelessWidget {
  CardsetEditPage({super.key, required this.cardset});

  Cardset cardset;

  ICardsetEditPageController cardsetEditPageController = Get.find();
  final ScreenSize screenSize = Get.find();
  void _fetchData() {
    cardsetEditPageController.setCardInputs(cardset);
    cardsetEditPageController.onInit();
  }

  @override
  Widget build(BuildContext context) {
    _fetchData();
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
      onPressed: cardsetEditPageController.addNewInputField,
      backgroundColor: Colors.grey,
      child: Icon(Icons.add, color: Colors.black),
    );
  }

  FloatingActionButton buildSaveButton() {
    return FloatingActionButton(
      onPressed: cardsetEditPageController.saveCardset,
      backgroundColor: Colors.grey,
      child: Icon(Icons.save, color: Colors.black),
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
                    validator: textFormFieldValidate),
                SizedBox(
                  height: screenSize.height * .02,
                ),
                buildCustomTextFormField(
                    controller: termController,
                    validator: textFormFieldValidate),
              ]),
            ),
          ],
        ));
  }

  String? textFormFieldValidate(value) {
    if (value?.isEmpty ?? true) {
      return "This field can't be empty";
    }
    return null;
  }
}
