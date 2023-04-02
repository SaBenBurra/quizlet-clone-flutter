import 'package:get/get.dart';
import 'package:quizlet_app/app/business/page_controllers/abstracts/cardset_list_page_controller.dart';
import 'package:quizlet_app/app/data/models/cardset.dart';
import 'package:quizlet_app/app/data/services/abstracts/cardset_manager.dart';

class CardsetListPageGetxController extends GetxController
    implements ICardsetListPageController {
  @override
  List<Cardset> cardsets = <Cardset>[].obs;
  ICardsetManager cardsetManager = Get.find();

  @override
  Future<List<Cardset>> getCardsets() async {
    await cardsetManager.getAll();
    cardsets.assignAll(cardsetManager.cardsets.values.toList());
    return cardsets;
  }
}
