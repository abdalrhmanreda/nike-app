import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import 'api_constant.dart';

class DioHelper {
  static late Dio dio;

  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstant.baseUrl,
        receiveDataWhenStatusError: true,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
    );
    debugPrint('Dio initialized');
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String lang = 'en',
    String? token,
  }) async {
    setHeaders(lang, token);
    return dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    setHeaders(lang, token);
    return dio.get(url, queryParameters: query);
  }

  static Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    String lang = 'en',
    String? token,
  }) async {
    setHeaders(lang, token);
    return dio.delete(url, queryParameters: query, data: data);
  }

  static void setHeaders(String lang, String? token) {
    dio.options.headers = {
      'lang': lang,
      'Authorization': token != null ? 'Bearer $token' : '',
    };
  }
}
