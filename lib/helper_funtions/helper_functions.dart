import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';

class HelperFucntions {
 static void navigateTo(BuildContext context, String routeName, [Map<String, dynamic>? data]) {
  Navigator.of(context).pushReplacementNamed(
    routeName,
    arguments: data,
  );
}

  static Future<http.Response> request(
    String url, {
    String method = 'GET',
    Map<String, String>? headers,
    Map<String, dynamic>? queryParams,
    dynamic data,
  }) async {
    try {
      Uri uri = Uri.parse(url);
      if (queryParams != null && queryParams.isNotEmpty) {
        uri = uri.replace(queryParameters: {
          ...uri.queryParameters,
          ...queryParams.map((k, v) => MapEntry(k, v.toString())),
        });
      }

      if (method == 'POST') {
        return await http.post(
          uri,
          headers: headers,
          body: data != null ? jsonEncode(data) : null,
        );
      } else {
        return await http.get(
          uri,
          headers: headers,
        );
      }
    } catch (e) {
      throw Exception('HTTP error: $e');
    }
  }

  static Future<http.Response> getApi(
    
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? queryParams,
  }) {
    String newUrl = Uri.parse(url).toString();
    return request(
      newUrl,
      method: 'GET',
      headers: headers,
      queryParams: queryParams,
    );
  }

  static Future<http.Response> postApi(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? queryParams,
    dynamic body,
  }) {
    return request(
      url,
      method: 'POST',
      headers: headers,
      queryParams: queryParams,
      data: body,
    );
  }
}