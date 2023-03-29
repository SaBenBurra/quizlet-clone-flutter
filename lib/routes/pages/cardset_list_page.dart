import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizlet_app/app/constants/color_constants.dart';
import 'package:quizlet_app/app/data/models/cardset.dart';
import 'package:quizlet_app/app/data/services/abstracts/cardset_manager.dart';
import 'package:quizlet_app/utils/screen_size.dart';
import 'package:quizlet_app/widgets/cardset_list_item.dart';

class CardsetListPage extends StatelessWidget {
  const CardsetListPage({super.key});

  @override
  Widget build(BuildContext context) {
    ICardsetManager cardsetManager = Get.find();
    cardsetManager.getAll();
    var screen = MediaQuery.of(context).size;
    ScreenSize screenSize =
        ScreenSize(width: screen.width, height: screen.height);
    Get.put(screenSize);

    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstants.darkBackgroundColor,
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenSize.width * .05,
          ),
          child: buildCardsetList(cardsetManager),
        ),
      ),
    );
  }

  Obx buildCardsetList(ICardsetManager cardsetManager) {
    return Obx(() => ListView.builder(
          itemCount: cardsetManager.cardsets.length,
          itemBuilder: (context, index) {
            Map<int, Cardset> cardsets = cardsetManager.cardsets;
            Cardset cardset = cardsets.values.elementAt(index);
            return CardsetListItem(
                cardset: cardset,
                tabId: 0);
          }));
  }
}
