import "package:dio/dio.dart";

class BaseDioApiProvider {
  static Dio dio = Dio(
    BaseOptions(
        baseUrl: "http://10.0.2.2:8080/api",
        contentType: Headers.jsonContentType,
        responseType: ResponseType.json),
  );
}
