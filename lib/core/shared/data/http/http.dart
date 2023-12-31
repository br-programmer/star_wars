// ignore_for_file: parameter_assignments

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:star_wars/core/core.dart';

export 'api_services.dart';
export 'perform_http_request.dart';
export 'result.dart';

enum HttpMethod { get, post, patch, put, delete }

class Http {
  Http({
    required Dio dio,
    required bool enableLogging,
  })  : _dio = dio,
        _enableLogging = enableLogging;

  final Dio _dio;
  final bool _enableLogging;

  Future<HttpResult<T>> send<T>(
    String path, {
    required T Function(int statusCode, dynamic data) parser,
    HttpMethod method = HttpMethod.get,
    Json queryParameters = const {},
    Map<String, String> headers = const {},
    Json body = const {},

    /// if autoDecodeReponse is false on the parser callback you
    /// will get response.bodyBytes (Uint8List)
    bool autoDecodeReponse = true,

    /// Timeout in milliseconds for receiving data.
    Duration? receiveTimeout,
  }) async {
    int? statusCode;
    try {
      final contentType = headers['content-type'] ?? headers['Content-Type'];

      final headerContentType =
          contentType == 'application/x-www-form-urlencoded'
              ? Headers.formUrlEncodedContentType
              : Headers.jsonContentType;

      final response = await _dio.request<dynamic>(
        path,
        queryParameters: queryParameters,
        data: body,
        options: Options(
          receiveTimeout: receiveTimeout,
          contentType: headerContentType,
          responseType: autoDecodeReponse ? null : ResponseType.bytes,
          method: method.name,
          headers: headers,
        ),
      );
      if (_enableLogging) {
        log(
          const JsonEncoder.withIndent(' ').convert({
            'url': response.realUri.toString(),
            'headers': response.requestOptions.headers,
            'statusCode': response.statusCode,
            'body': body,
          }),
        );
      }

      statusCode = response.statusCode;
      final responseBody = response.data;

      if (autoDecodeReponse && (responseBody is Map || responseBody is List)) {
        log(const JsonEncoder.withIndent(' ').convert(responseBody));
      }

      if (statusCode! >= HttpStatus.ok && statusCode < HttpStatus.badRequest) {
        return HttpResult.success(
          statusCode,
          parser(statusCode, responseBody),
        );
      }
      return HttpResult.failed(statusCode, responseBody);
    } on DioException catch (e) {
      if (_enableLogging) {
        log(
          const JsonEncoder.withIndent(' ').convert(
            {
              'url': e.requestOptions.uri.toString(),
              'headers': e.requestOptions.headers,
              'method': e.requestOptions.method,
              'request body': e.requestOptions.data,
              'response body': e.response?.data,
              'statusCode': e.response?.statusCode,
              'message': e.message,
            },
          ),
          stackTrace: e.stackTrace,
        );
      }
      return HttpResult.failed(e.response?.statusCode, e.response?.data);
    } catch (e, s) {
      if (_enableLogging) {
        log(e.toString(), stackTrace: s);
      }
      return HttpResult.failed(statusCode, e);
    }
  }
}
