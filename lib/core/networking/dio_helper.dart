import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static void init() {
    dio = Dio(
      BaseOptions(
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );
  }

  static Future<Response> getData({
    required String methodUrl,
    String lang = 'ar',
    Map<String, dynamic>? queryParameters,
  }) async {
    dio.options.headers = {'lang': lang, 'Content-Type': 'application/json'};
    return await dio.get(methodUrl, queryParameters: queryParameters);
  }
}
