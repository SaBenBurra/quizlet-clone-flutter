import 'package:dio/dio.dart';

abstract class ICardsetApiProvider {
  Future<Response> getAll();
  Future<Response> update(
      int id, String cardsetName, List<Map<String, String>> cardsData);
  Future<Response> remove(int id);
}
