import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizlet_app/app/business/page_controllers/abstracts/cardset_list_page_controller.dart';
import 'package:quizlet_app/app/constants/color_constants.dart';
import 'package:quizlet_app/app/data/models/cardset.dart';
import 'package:quizlet_app/routes/pages/cardset_detail_page.dart';
import 'package:quizlet_app/routes/pages/cardset_edit_page.dart';
import 'package:quizlet_app/utils/screen_size.dart';

class CardsetListItem extends StatelessWidget {
  CardsetListItem(
      {super.key,
      required this.cardset,
      required this.tabId,
      this.index,
      this.cardsetListPageController});

  final Cardset cardset;
  final int tabId;
  final ScreenSize screenSize = Get.find();
  final int? index;

  ICardsetListPageController? cardsetListPageController;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: screenSize.height * .015),
        width: double.infinity,
        decoration: BoxDecoration(
            color: ColorConstants.darkSecondaryAppColor,
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: screenSize.height * .02,
              horizontal: screenSize.width * .03),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              cardset.name,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: screenSize.width * .05,
                  color: Colors.white),
            ),
            SizedBox(
              height: screenSize.width * .03,
            ),
            Text("contains ${cardset.cardCount.toString()} card",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Color(0xFF939BB4))),
            const SizedBox(
              height: 50,
            )
          ]),
        ),
      ),
    );
  }

  void onTap() {
    if (cardset.cardCount > 0) {
      Get.to(
          CardsetDetailPage(
              tabId: tabId, cardset: cardset, cardsetIndex: index),
          id: tabId);
    } else {
      Get.to(
          CardsetEditPage(
              cardset: cardset,
              cardsetListPageController: cardsetListPageController,
              cardsetIndex: index),
          id: tabId);
    }
  }
}
