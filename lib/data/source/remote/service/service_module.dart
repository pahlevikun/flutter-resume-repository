import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:omega_dio_logger/omega_dio_logger.dart';
import 'package:pahlevikun.github.io/config/build_config.dart';
import 'package:pahlevikun.github.io/data/source/remote/service/mailer_api_service.dart';
import 'package:pahlevikun.github.io/data/source/remote/service/medium_api_service.dart';

@module
abstract class ServiceModule {
  @factory
  @Named("mailer_api_service")
  MailerApiService provideMailerApiService(
    @Named("dio_mailer") Dio dio,
    @Named("base_url_mailer") String baseUrl,
  ) {
    return MailerApiService(
      dio,
      baseUrl: baseUrl,
    );
  }

  @factory
  @Named("medium_api_service")
  MediumApiService provideMediumApiService(
    @Named("dio_medium") Dio dio,
    @Named("base_url_medium") String baseUrl,
  ) {
    return MediumApiService(
      dio,
      baseUrl: baseUrl,
    );
  }

  @Named("dio_mailer")
  @Singleton()
  Dio provideDio(
    @Named("base_options_mailer") BaseOptions baseOptions,
    OmegaDioLogger logger,
  ) {
    final dio = Dio(baseOptions);
    dio.interceptors.add(logger);
    return dio;
  }

  @Named("dio_medium")
  @Singleton()
  Dio provideDioMedium(
    @Named("base_options_medium") BaseOptions baseOptions,
    OmegaDioLogger logger,
  ) {
    final dio = Dio(baseOptions);
    dio.interceptors.add(logger);
    return dio;
  }

  @Singleton()
  OmegaDioLogger provideDioLogger(
    @Named("build_mode") bool isDebug,
  ) {
    return OmegaDioLogger(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      error: true,
      requestQueryParameters: true,
      convertFormData: true,
      colorized: true,
      showCurl: true,
      logPrint: print,
      showLog: isDebug && BuildConfig.BUILD_LOG_ENABLED_MODE && kDebugMode,
    );
  }

  @Singleton()
  @Named("base_options_mailer")
  BaseOptions provideDioBaseOptionsMailer(
    @Named("base_url_mailer") String baseUrl,
    @Named("connect_time_out") int connectTimeOut,
    @Named("read_time_out") int readTimeOut,
  ) {
    return BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: Duration(milliseconds: connectTimeOut),
      receiveTimeout: Duration(milliseconds: readTimeOut),
    );
  }

  @Singleton()
  @Named("base_options_medium")
  BaseOptions provideDioBaseOptionsMedium(
    @Named("base_url_medium") String baseUrl,
    @Named("connect_time_out") int connectTimeOut,
    @Named("read_time_out") int readTimeOut,
  ) {
    return BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: Duration(milliseconds: connectTimeOut),
      receiveTimeout: Duration(milliseconds: readTimeOut),
    );
  }

  @Singleton()
  @Named("read_time_out")
  int get readTimeOut => 60000;

  @Singleton()
  @Named("connect_time_out")
  int get connectTimeOut => 60000;

  @Singleton()
  @Named("base_url_medium")
  String get baseUrlMedium => BuildConfig.RSS_END_POINT;

  @Singleton()
  @Named("base_url_mailer")
  String get baseUrlMailer => BuildConfig.MAILER_END_POINT;
}
