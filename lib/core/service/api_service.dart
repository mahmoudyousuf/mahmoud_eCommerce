import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio_logging_interceptor/dio_logging_interceptor.dart';
import 'package:mahmoud_task/core/shared_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  final _baseUrl = 'https://www.cheapshark.com/';
  final Dio _dio;
  final SharedPreferences sharedPreferences;

  ApiService(this._dio, this.sharedPreferences) {
    _dio.interceptors.add(
      DioLoggingInterceptor(
        level: Level.body,
        compact: false,
      ),
    );
  }

  Future<ApiData> get({required String endPoint}) async {
    var response = await _dio.get(
      '$_baseUrl$endPoint',
      options: Options(headers: {
        "Content-Type": "application/json",
        'Accept': 'application/json',
        "Authorization":
            "Bearer ${sharedPreferences.getString(SharedConstants.token) ?? ""}",
      }),
    );

    if (200 <= response.statusCode! && response.statusCode! <= 300) {
      final map = <String, dynamic>{};
      map.putIfAbsent('data', () => response.data);

      return ApiData(
          data: map,
          code: response.statusCode ?? 0,
          errorMessage: "",
          success: true);
    } else {
      // String jsonUser = jsonEncode(response.data['message']);

      return ApiData(
          data: response.data,
          code: response.statusCode ?? 0,
          errorMessage: "error",
          success: false);
    }
  }

  Future<int> delete({required String endPoint}) async {
    var response = await _dio.delete(
      '$_baseUrl$endPoint',
      options: Options(headers: {
        "Content-Type": "application/json",
        'Accept': 'application/json',
        "Authorization":
            "Bearer ${sharedPreferences.getString(SharedConstants.token) ?? ""}",
      }),
    );

    return response.statusCode!;
  }

  Future<ApiData> post({required String endPoint, String? rawData}) async {
    var response = await _dio.post(
      '$_baseUrl$endPoint',
      data: rawData,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          'Accept': 'application/json',
          "Authorization":
              "Bearer ${sharedPreferences.getString(SharedConstants.token) ?? ""}",
        },
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
        contentType: Headers.formUrlEncodedContentType,
      ),
    );

    if (200 <= response.statusCode! &&
        response.statusCode! <= 300 &&
        jsonEncode(response.data['status']) == "true") {
      return ApiData(
          data: response.data,
          code: response.statusCode ?? 0,
          errorMessage: "",
          success: true);
    } else {
      String jsonUser = jsonEncode(response.data['message']);
      return ApiData(
          data: response.data,
          code: response.statusCode ?? 0,
          errorMessage: jsonUser,
          success: false);
    }
  }

  Future<ApiData> postMultipart(
      {required String endPoint, FormData? rawData}) async {
    var response = await _dio.post(
      '$_baseUrl$endPoint',
      data: rawData,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          "Authorization":
              "Bearer ${sharedPreferences.getString(SharedConstants.token) ?? ""}",
        },
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
        contentType: Headers.formUrlEncodedContentType,
      ),
    );

    if (200 <= response.statusCode! &&
        response.statusCode! <= 300 &&
        jsonEncode(response.data['status']) == "true") {
      return ApiData(
          data: response.data,
          code: response.statusCode ?? 0,
          errorMessage: "",
          success: true);
    } else {
      String jsonUser = jsonEncode(response.data['message']);
      return ApiData(
          data: response.data,
          code: response.statusCode ?? 0,
          errorMessage: jsonUser,
          success: false);
    }
  }
}

class ApiData {
  final Map<String, dynamic> data;
  final int code;
  final String errorMessage;
  final bool success;

  const ApiData(
      {required this.data,
      required this.code,
      required this.errorMessage,
      required this.success});

  ApiData copyWith({
    Map<String, dynamic>? data,
    int? code,
    String? errorMessage,
    bool? success,
  }) {
    return ApiData(
      data: data ?? this.data,
      code: code ?? this.code,
      errorMessage: errorMessage ?? this.errorMessage,
      success: success ?? this.success,
    );
  }
}
