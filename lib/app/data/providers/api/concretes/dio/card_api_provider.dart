import 'package:dio/dio.dart';
import 'package:quizlet_app/app/data/providers/api/abstracts/card_api_provider.dart';
import 'package:quizlet_app/app/data/providers/api/concretes/dio/base_api_provider.dart';

class CardDioApiProvider implements ICardApiProvider {
  @override
  Future<Response> getByCardsetId(int cardsetId) {
    Future<Response> response =
        BaseDioApiProvider.dio.get("/cards?cardsetId=$cardsetId");
    return response;
  }
}
