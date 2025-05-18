import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HelperFucntions{
  static void navigateTo(BuildContext context, String routeName) {
  Navigator.of(context).pushReplacementNamed(routeName);
}

  static final Dio dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 15),
      responseType: ResponseType.json,
    ),
  );

  static Future<Response> request(
    String url, {
    String method = 'GET',
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParams,
    dynamic data,
  }) async {
    try {
      final opts = Options(
        method: method,
        headers: headers,
      );

      final response = await dio.request(
        url,
        options: opts,
        queryParameters: queryParams,
        data: data,
      );

      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        return response;
      } else {
        throw Exception(
          'Request failed [${response.statusCode}]: ${response.statusMessage}',
        );
      }
    } on DioException catch (e) {
      throw Exception('Dio error: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }


  static Future<Response> getApi(
    String url, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParams,
  }) =>
      request(
        url,
        method: 'GET',
        headers: headers,
        queryParams: queryParams,
      );

  static Future<Response> postApi(
    String url, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParams,
    dynamic body,
  }) =>
      request(
        url,
        method: 'POST',
        headers: headers,
        queryParams: queryParams,
        data: body,
      );

}







