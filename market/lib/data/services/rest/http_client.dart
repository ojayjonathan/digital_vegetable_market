part of 'client.dart';

class RequestInterceptor extends Interceptor {
  final Dio dio;
  RequestInterceptor({required this.dio});

  @override
  FutureOr<dynamic> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) {
    final authToken = AppRepository.instance.authToken;
    if (authToken != null && authToken.isNotEmpty) {
      options.headers["Authorization"] = "Bearer $authToken";
    }
    super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      /// LOGOUT the user and clear the auth token
      AppRepository.instance.logout();
    }
    super.onError(err, handler);
  }
}

// TODO: Reduce the timeouts
Dio _httpClient = Dio(
  BaseOptions(
    baseUrl: BASE_URL,
    sendTimeout: 10000000,
    receiveTimeout: 10000000,
    connectTimeout: 10000000,
  ),
);

///[Deserializer] takes in data and tranform it to desired type[X]
typedef Deserializer<X> = X Function(dynamic data);
typedef Result<T> = Future<HttpResult<T>>;

class Http {
  static final dio = _httpClient
    ..interceptors.add(
      RequestInterceptor(dio: _httpClient),
    );
  static Result<T> get<T>(
    String url, {
    Options? options,
    Deserializer<T>? deserializer,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final res =
          await dio.get(url, options: options, queryParameters: queryParams);
      return HttpResult.onSuccess(
        data: deserializer != null ? deserializer(res.data) : res.data,
      );
    } catch (error) {
      return HttpResult.onError(
        error: getException(error),
      );
    }
  }

  static Result<T> post<T>(
    String url,
    dynamic data, {
    Options? options,
    Deserializer<T>? deserializer,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      print(data);
      final res = await dio.post(url,
          data: data, options: options, queryParameters: queryParams);
      return HttpResult.onSuccess(
        data: deserializer != null ? deserializer(res.data) : res.data,
      );
    } catch (error) {
      print(error);
      return HttpResult.onError(error: getException(error));
    }
  }

  static Result<T> put<T>(
    String url,
    dynamic data, {
    Options? options,
    Deserializer<T>? deserializer,
  }) async {
    try {
      final res = await dio.put(url, data: data, options: options);
      return HttpResult.onSuccess(
        data: deserializer != null ? deserializer(res.data) : res.data,
      );
    } catch (error) {
      print(error);
      return HttpResult.onError(error: getException(error));
    }
  }

  static Result<T> patch<T>(
    String url,
    dynamic data, {
    Options? options,
    Deserializer<T>? deserializer,
  }) async {
    try {
      final res = await dio.patch(url, data: data, options: options);
      return HttpResult.onSuccess(
        data: deserializer != null ? deserializer(res.data) : res.data,
      );
    } catch (error) {
      print(error);
      return HttpResult.onError(error: getException(error));
    }
  }

  static Result<T> delete<T>(
    String url, {
    Options? options,
    Deserializer<T>? deserializer,
  }) async {
    try {
      final res = await dio.delete(url, options: options);
      return HttpResult.onSuccess(
        data: deserializer != null ? deserializer(res.data) : res.data,
      );
    } catch (error) {
      print(error);
      return HttpResult.onError(error: getException(error));
    }
  }
}
