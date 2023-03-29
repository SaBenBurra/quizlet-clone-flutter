import 'package:flutter/material.dart' hide BackButton, Card;
import 'package:get/get.dart';
import 'package:quizlet_app/app/business/page_controllers/abstracts/cardset_detail_page_controller.dart';
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
  int tabId;
  Cardset cardset;
  CardsetDetailPage({super.key, required this.tabId, required this.cardset});

  final ScreenSize screenSize = Get.find();
  final ICardsetManager cardsetManager = Get.find();
  final ICardManager cardManager = Get.find();
  final ICardsetDetailPageController pageController = Get.find();
  @override
  Widget build(BuildContext context) {
    pageController.currentlyShowingCardset = cardset.obs;
    return SafeArea(
      child: Scaffold(
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
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
              pageController.currentlyShowingCardset.value.cards =
                  snapshot.data;
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
          onPressed: () {
            Get.to(CardsetEditPage(cardset: cardset), id: tabId);
          },
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
            card: pageController.currentlyShowingCardset.value
                .cards![pageController.cardIndex.value])));
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
          pageController.currentlyShowingCardset.value.name,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(color: ColorConstants.darkFourthAppColor),
        ),
      ),
    );
  }
}
