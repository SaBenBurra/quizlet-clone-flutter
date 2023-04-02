import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizlet_app/app/business/page_controllers/abstracts/cardset_list_page_controller.dart';
import 'package:quizlet_app/app/constants/color_constants.dart';
import 'package:quizlet_app/app/data/models/cardset.dart';
import 'package:quizlet_app/app/data/services/abstracts/cardset_manager.dart';
import 'package:quizlet_app/utils/screen_size.dart';
import 'package:quizlet_app/widgets/cardset_list_item.dart';

class CardsetListPage extends StatelessWidget {
  CardsetListPage({super.key});
  final ICardsetListPageController pageController = Get.find();

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    ScreenSize screenSize =
        ScreenSize(width: screen.width, height: screen.height);
    Get.put(screenSize);
    pageController.getCardsets();

    return SafeArea(
      child: Scaffold(
        floatingActionButton: buildCreateCardsetButton(),
        backgroundColor: ColorConstants.darkBackgroundColor,
        body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenSize.width * .05,
            ),
            child: FutureBuilder<List<Cardset>>(
                future: pageController.getCardsets(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) return Text(snapshot.error.toString());

                  return buildCardsetList();
                })),
      ),
    );
  }

  FloatingActionButton buildCreateCardsetButton() => FloatingActionButton(backgroundColor: Colors.grey, child: Icon(Icons.add, color: Colors.black), onPressed: pageController.createButtonAction);

  Widget buildCardsetList() {
    return Obx(() {
      List<Cardset> cardsets = pageController.cardsets;
      return ListView.builder(
          itemCount: cardsets.length,
          itemBuilder: (context, index) {
            Cardset cardset = cardsets[index];
            return CardsetListItem(cardset: cardset, tabId: 0, index: index, cardsetListPageController: pageController,);
          });
    });
  }
}
