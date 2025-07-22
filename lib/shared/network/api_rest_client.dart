import 'package:dio/dio.dart';

import '../network/api_rest_result.dart';

enum HttpMethod { get, put, post, delete, patch }

abstract class ApiRestClient {
  Future<APIResult> call(
    HttpMethod method,
    String url, {
    Object? body,
    Options? options,
  });
}

class ApiRestClientImpl extends ApiRestClient {
  ApiRestClientImpl(this._httpClient);

  final Dio _httpClient;

  /// Make the request to api rest [url]
  /// with optional [body] and [options] based on the http [method]
  /// And return [APIResult] object
  @override
  Future<APIResult> call(
    HttpMethod method,
    String url, {
    Object? body,
    Options? options,
  }) {
    switch (method) {
      case HttpMethod.get:
        return _get(url, options: options);
      case HttpMethod.post:
        return _post(url, body: body, options: options);
      case HttpMethod.put:
        throw UnimplementedError();
      case HttpMethod.delete:
        throw UnimplementedError();
      case HttpMethod.patch:
        throw UnimplementedError();
    }
  }

  /// Make a http get request to the specific [url]
  Future<APIResult> _get(String url, {Options? options}) async {
    try {
      final response = await _httpClient.get<Object>(
        url,
        options: options ?? Options(responseType: ResponseType.plain),
      );
      return _mapResponse(response);
    } on DioException catch (exception) {
      return _mapResponse(exception.response);
    }
  }

  /// Make a http post request to the specific [url]
  /// With the specific [body] and [options]
  Future<APIResult> _post(String url, {Object? body, Options? options}) async {
    try {
      final response = await _httpClient.post<Object>(
        url,
        data: body,
        options: options ?? Options(responseType: ResponseType.plain),
      );
      return _mapResponse(response);
    } on DioException catch (exception) {
      return _mapResponse(exception.response);
    }
  }

  /// Map HTTP [Response] object to [APIResult]
  APIResult _mapResponse(Response? response) {
    if (response != null) {
      final data = response.data is Map<String, dynamic>
          ? response.data as Map<String, dynamic>?
          : response.data;
      if (response.statusCode! >= 200 && response.statusCode! <= 300) {
        return APIResult.succeeded(data: data);
      } else {
        return APIResult.failed(data: data);
      }
    } else {
      return const APIResult.error('Unexpected error');
    }
  }
}
