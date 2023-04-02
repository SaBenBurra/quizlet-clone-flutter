import 'package:quizlet_app/app/data/models/cardset.dart';

abstract class ICardsetListPageController {
  List<Cardset> cardsets = [];
  Future<List<Cardset>> getCardsets();
}
