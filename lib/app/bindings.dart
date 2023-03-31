import 'package:get/get.dart';
import 'package:quizlet_app/app/business/page_controllers/abstracts/cardset_detail_page_controller.dart';
import 'package:quizlet_app/app/business/page_controllers/abstracts/cardset_edit_page_controller.dart';
import 'package:quizlet_app/app/business/page_controllers/concretes/cardset_detail_page_controller.dart';
import 'package:quizlet_app/app/business/page_controllers/concretes/cardset_edit_page_controller.dart';
import 'package:quizlet_app/app/data/providers/api/abstracts/card_api_provider.dart';
import 'package:quizlet_app/app/data/providers/api/abstracts/cardset_api_provider.dart';
import 'package:quizlet_app/app/data/providers/api/concretes/dio/card_api_provider.dart';
import 'package:quizlet_app/app/data/providers/api/concretes/dio/cardset_api_provider.dart';
import 'package:quizlet_app/app/data/services/abstracts/card_manager.dart';
import 'package:quizlet_app/app/data/services/abstracts/cardset_manager.dart';
import 'package:quizlet_app/app/data/services/concretes/card_manager.dart';
import 'package:quizlet_app/app/data/services/concretes/cardset_manager.dart';

class Bindings {
  static void bindAll() {
    _bindApiProviders();
    _bindEntityManagers();
    _bindPageControllers();
  }

  static void _bindApiProviders() {
    ICardsetApiProvider cardsetApiProvider = CardsetDioApiProvider();
    ICardApiProvider cardApiProvider = CardDioApiProvider();

    Get.put(cardsetApiProvider);
    Get.put(cardApiProvider);
  }

  static void _bindEntityManagers() {
    ICardsetManager cardsetManager = CardsetGetxManager();
    ICardManager cardManager = CardGetxManager();

    Get.put(cardsetManager);
    Get.put(cardManager);
  }

  static void _bindPageControllers() {
    ICardsetDetailPageController cardsetDetailPageController =
        CardsetDetailPageGetxController();
    ICardsetEditPageController cardsetEditPageController =
        CardsetEditPageGetxController();

    Get.put(cardsetDetailPageController);
    Get.put(cardsetEditPageController);
  }
}
