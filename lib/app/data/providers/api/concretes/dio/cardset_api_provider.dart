import 'package:dio/dio.dart';
import 'package:quizlet_app/app/data/providers/api/abstracts/cardset_api_provider.dart';

import 'base_api_provider.dart';

class CardsetDioApiProvider implements ICardsetApiProvider {
  @override
  Future<Response> getAll() {
    Future<Response> response = BaseDioApiProvider.dio.get("/cardsets");
    return response;
  }

  @override
  Future<Response> update(
      int id, String cardsetName, List<Map<String, String>> cardsData) {
    Future<Response> response = BaseDioApiProvider.dio.put("/cardsets/$id",
        data: {"name": cardsetName, "cards": cardsData});
    return response;
  }
}
