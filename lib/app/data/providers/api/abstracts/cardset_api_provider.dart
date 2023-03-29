import 'package:dio/dio.dart';

abstract class ICardsetApiProvider {
  Future<Response> getAll();
}
