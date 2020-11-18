import 'package:dio/dio.dart';
import 'package:flutter_weatherapp/core/network/http_client.dart';

import 'http_response.dart';

abstract class BaseService {
  final client = HttpClient();

  Future<HttpResponse> get(String path, {dynamic params}) async {
    return await call(client.get(path, params: params));
  }

  Future<HttpResponse> post(String path, {dynamic body}) async {
    return await call(client.post(path, body: body));
  }

  Future<HttpResponse> call(Future<Response<dynamic>> call) async {
    HttpResponse response = HttpResponse();
    await call.then((res) {
      response.statusCode = res.statusCode;
      response.data = res.data;
      response.message = res.statusMessage;
    }).catchError((e) {
      response.statusCode = 500;
      response.data = null;
      response.message = e.toString();
    });

    return response;
  }
}

extension ServiceExt on HttpResponse<dynamic> {
  HttpResponse<T> map<T>(T mapper) {
    return HttpResponse(
        statusCode: this.statusCode, data: mapper, message: this.message);
  }
}
