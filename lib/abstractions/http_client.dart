abstract class HttpClient {
  Future<HttpResponse<T>> delete<T>(
    String url, {
    data,
  });

  Future<HttpResponse<T>> get<T>(String url,
      [Map<String, dynamic>? queryParameters]);

  Future<HttpResponse<T>> patch<T>(
    String url, {
    data,
  });

  Future<HttpResponse<T>> post<T>(
    String url, {
    data,
    Map<String, String>? header,
  });

  Future<HttpResponse<T>> put<T>(
    String url, {
    data,
  });
}

class HttpResponse<T> {
  final T data;
  final int statusCode;

  HttpResponse(
    this.data,
    this.statusCode,
  );

  bool isNotFound() {
    return statusCode == 404;
  }

  bool isOk() {
    return statusCode == 200;
  }
}
