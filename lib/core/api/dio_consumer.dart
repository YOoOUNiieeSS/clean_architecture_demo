import 'dart:convert';
import 'dart:io';

import 'package:clean_architecture/core/api/api_consumer.dart';
import 'package:clean_architecture/core/api/app_interceptor.dart';
import 'package:clean_architecture/core/api/status_code.dart';
import 'package:clean_architecture/core/error/exceptions.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

class DioConsumer implements ApiConsumer {
  final Dio client;

  DioConsumer({required this.client}) {
    (client.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    client.options
      // ..baseUrl = AppStrings.baseurl
      ..responseType = ResponseType.plain
      ..followRedirects = false
      ..validateStatus = (status) => status! < StatusCode.internalServerError;
    client.interceptors.add(AppInterceptors());
  }
  @override
  Future get(
      {required String path, Map<String, dynamic>? queryParameters}) async {
    try {
      final response =
          await client.post(path, queryParameters: queryParameters);
      return _handleResponseAsJson(response);
    } on DioError catch (error) {
      _handleDioError(error);
    }
  }

  @override
  Future post(
      {required String path,
      Map<String, dynamic>? queryParameters,
      bool formDataIsEnabled = false,
      Map<String, dynamic>? body}) async {
    try {
      final response = await client.post(path,
          queryParameters: queryParameters,
          data: formDataIsEnabled ? FormData.fromMap(body!) : body);
      return _handleResponseAsJson(response);
    } on DioError catch (error) {
      _handleDioError(error);
    }
  }

  @override
  Future put(
      {required String path,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? body}) async {
    try {
      final response =
          await client.post(path, queryParameters: queryParameters, data: body);
      return _handleResponseAsJson(response);
    } on DioError catch (error) {
      _handleDioError(error);
    }
  }

  dynamic _handleResponseAsJson(Response<dynamic> body) {
    return jsonDecode(body.data.toString());
  }

  dynamic _handleDioError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        throw const FetchDataException();
      case DioErrorType.response:
        switch (error.response?.statusCode) {
          case StatusCode.badRequest:
            throw const BadRequestException();
          case StatusCode.unauthorized:
          case StatusCode.forbidden:
            throw const UnauthorizedException();
          case StatusCode.notFound:
            throw const NotFoundException();
          case StatusCode.conflict:
            throw const ConflictException();
          case StatusCode.internalServerError:
            throw const InternalServerErrorException();
        }
        break;
      case DioErrorType.cancel:
        break;
      case DioErrorType.other:
        throw const NoInternetConnectionException();
    }
  }
}
