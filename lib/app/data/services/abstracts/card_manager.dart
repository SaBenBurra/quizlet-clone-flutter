import 'package:get/get.dart';
import 'package:quizlet_app/app/data/models/card.dart';

abstract class ICardManager {
    Future<List<Card>>? getCardsByCardsetId(int cardsetId);
  }
