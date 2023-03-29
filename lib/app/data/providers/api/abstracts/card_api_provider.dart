import 'package:dio/dio.dart';

abstract class ICardApiProvider {
  Future<Response> getByCardsetId(int cardsetId);
}
