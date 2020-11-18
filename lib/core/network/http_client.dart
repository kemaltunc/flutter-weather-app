import 'package:dio/dio.dart';
import 'package:flutter_weatherapp/core/config/app_config.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class HttpClient {
  Dio _client;

  HttpClient() {
    _client = Dio();
    _client.interceptors.add(_header());
    _client.interceptors.add(_logger());
    _client.options.baseUrl = baseUrl;
    _client.options.connectTimeout = connectTimeOut;
    _client.options.receiveTimeout = receiveTimeOut;
  }

  Interceptor _header() {
    return InterceptorsWrapper(onRequest: (RequestOptions request) async {
      request.headers.addAll({"key": apiKey});
      return request;
    });
  }

  Interceptor _logger() {
    return PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90);
  }

  Future<Response> get(String url, {dynamic params}) =>
      _client.get(url, queryParameters: params);

  Future<Response> post(String url, {dynamic body}) =>
      _client.post(url, data: body);

  Future<Response> put(String url, {dynamic body}) =>
      _client.put(url, data: body);

  Future<Response> delete(String url, {dynamic body}) => _client.delete(url);
}

final int connectTimeOut = 30000;
final int receiveTimeOut = 30000;
