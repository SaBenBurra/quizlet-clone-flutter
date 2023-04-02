import 'package:flutter/material.dart' hide BackButton, Card;
import 'package:get/get.dart';
import 'package:quizlet_app/app/business/page_controllers/abstracts/cardset_detail_page_controller.dart';
import 'package:quizlet_app/app/business/page_controllers/concretes/cardset_detail_page_controller.dart';
import 'package:quizlet_app/app/constants/color_constants.dart';
import 'package:quizlet_app/app/data/models/card.dart';
import 'package:quizlet_app/app/data/models/cardset.dart';
import 'package:quizlet_app/app/data/services/abstracts/card_manager.dart';
import 'package:quizlet_app/app/data/services/abstracts/cardset_manager.dart';
import 'package:quizlet_app/routes/pages/cardset_edit_page.dart';
import 'package:quizlet_app/utils/screen_size.dart';
import 'package:quizlet_app/widgets/custom_button1.dart';
import 'package:quizlet_app/widgets/custom_flip_card.dart';

class CardsetDetailPage extends StatelessWidget {
  CardsetDetailPage(
      {super.key,
      required this.tabId,
      required this.cardset,
      this.cardsetIndex});

  final ICardsetDetailPageController pageController =
      Get.put(CardsetDetailPageGetxController(), tag: UniqueKey().toString());

  int tabId;
  Cardset cardset;
  final ScreenSize screenSize = Get.find();
  final ICardsetManager cardsetManager = Get.find();
  final ICardManager cardManager = Get.find();
  final int? cardsetIndex;

  @override
  Widget build(BuildContext context) {
    pageController.init(cardsetIndex: cardsetIndex, cardset: cardset, tabId: tabId);

    return SafeArea(
      child: Scaffold(
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            buildRemoveButton(),
            SizedBox(height: screenSize.height * .02),
            buildEditButton(),
            SizedBox(height: screenSize.height * .05)
          ],
        ),
        backgroundColor: ColorConstants.darkBackgroundColor,
        appBar: buildAppBar(context),
        body: FutureBuilder<List<Card>>(
            future: cardManager.getCardsByCardsetId(cardset.id),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) return Text(snapshot.error.toString());
              pageController.cardset.value.cards = snapshot.data;
              return ListView(children: [
                SizedBox(height: screenSize.height * .05),
                buildCard(),
                SizedBox(height: screenSize.height * .05),
                buildNextPrevButtons()
              ]);
            }),
      ),
    );
  }

  Widget buildEditButton() {
    return SizedBox(
      width: screenSize.width * .13,
      height: screenSize.width * .13,
      child: FittedBox(
        child: FloatingActionButton(
          onPressed: pageController.editButtonAction,
          backgroundColor: ColorConstants.darkSixthAppColor,
          child: Icon(Icons.edit,
              size: screenSize.width * .07,
              color: ColorConstants.darkFifthAppColor),
        ),
      ),
    );
  }

  Widget buildCard() {
    return Center(
        child: Obx(() => CustomFlipCard(
            card: pageController
                .cardset.value.cards![pageController.cardIndex.value])));
  }

  Widget buildNextPrevButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildCustomButton1(
            text: "Önceki",
            onPressed: () {
              pageController.decreaseCardIndex();
            }),
        SizedBox(width: screenSize.width * .05),
        buildCustomButton1(
            text: "Sonraki",
            onPressed: () {
              pageController.increaseCardIndex();
            }),
      ],
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: ColorConstants.darkBackgroundColor,
      title: Obx(
        () => Text(
          pageController.cardset.value.name,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(color: ColorConstants.darkFourthAppColor),
        ),
      ),
    );
  }

  Widget buildRemoveButton() {
    return SizedBox(
      width: screenSize.width * .13,
      height: screenSize.width * .13,
      child: FittedBox(
        child: FloatingActionButton(
          heroTag: "removeButton",
          onPressed: pageController.removeButtonAction,
          backgroundColor: Colors.red,
          child: Icon(Icons.delete,
              size: screenSize.width * .07,
              color: ColorConstants.darkFifthAppColor),
        ),
      ),
    );
  }
}
