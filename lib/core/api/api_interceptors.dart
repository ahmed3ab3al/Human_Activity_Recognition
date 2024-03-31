import 'package:dio/dio.dart';

class ApiInterceptors extends Interceptor {

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Accept'] = 'application/json';
    options.headers['Content-Type'] = 'application/json';
    super.onRequest(options, handler);
  }
}

//options.headers[ApiKeys.token] = CacheHelper().getData(key: ApiKeys.token);