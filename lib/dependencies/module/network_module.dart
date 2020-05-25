import 'package:dio/dio.dart';
import 'package:pahlevikun.github.io/build_config.dart';
import 'package:pahlevikun.github.io/dependencies/module/dio_interceptor.dart';

class NetworkModule {
  static const int CONNECT_TIME_OUT = 20000;
  static const int RECEIVE_TIME_OUT = 15000;

  buildDio() {
    if (BuildConfig.isDebugMode) {
      return _attachInterceptorWith(_initDio());
    } else {
      return _initDio();
    }
  }

  _initDio() {
    BaseOptions options = BaseOptions(
      connectTimeout: CONNECT_TIME_OUT,
      receiveTimeout: RECEIVE_TIME_OUT,
    );
    Dio dio = Dio(options);
    return dio;
  }

  _attachInterceptorWith(Dio dio) {
    dio.interceptors.add(DioInterceptor(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        compact: true));
    return dio;
  }
}
