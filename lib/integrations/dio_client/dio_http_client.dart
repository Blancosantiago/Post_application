import 'package:challenge_application/abstractions/http_client.dart';
import 'package:challenge_application/integrations/dio_client/dio_interceptors.dart';
import 'package:dio/dio.dart';

class DioHttpClient implements HttpClient {
  final Dio _dioInstance = Dio()
    ..interceptors.addAll([
      DioInterceptorConfig(),
    ]);

  @override
  Future<HttpResponse<T>> delete<T>(String url, {data}) async {
    var response = await _dioInstance.delete(url, data: data);
    return HttpResponse(response.data, response.statusCode!);
  }

  @override
  Future<HttpResponse<T>> get<T>(String url,
      [Map<String, dynamic>? queryParameters]) async {
    try {
      var response =
          await _dioInstance.get(url, queryParameters: queryParameters);
      return HttpResponse(
        response.data,
        response.statusCode!,
      );
    } on DioException catch (e) {
      return HttpResponse(
        e.response!.data,
        e.response!.statusCode!,
      );
    }
  }

  @override
  Future<HttpResponse<T>> patch<T>(String url, {data}) async {
    var response = await _dioInstance.patch(url, data: data);
    return HttpResponse(response.data, response.statusCode!);
  }

  @override
  Future<HttpResponse<T>> post<T>(String url,
      {data, Map<String, String>? header}) async {
    try {
      var response = await _dioInstance.post(url,
          data: data, options: Options(headers: header));
      return HttpResponse(response.data, response.statusCode!);
    } on DioException catch (e) {
      return HttpResponse(
        e.response!.data,
        e.response!.statusCode!,
      );
    }
  }

  @override
  Future<HttpResponse<T>> put<T>(String url, {data}) async {
    var response = await _dioInstance.put(url, data: data);
    return HttpResponse(response.data, response.statusCode!);
  }
}
