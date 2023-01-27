import 'package:dio/dio.dart';
import 'package:movie_app/app_setup/dio/interceptors/error_interceptors.dart';
import 'package:movie_app/app_setup/dio/interceptors/request_interceptors.dart';
import 'package:movie_app/app_setup/dio/interceptors/response_interceptors.dart';

Dio dioClient() {
  final dio = Dio();
  final options = BaseOptions(
    connectTimeout: 30000, //30 sec
    receiveTimeout: 30000,
    baseUrl: 'https://api.themoviedb.org/3/',
    queryParameters: {
      'api_key': '9f0fb2de3cc3675f6df16f06ffd8edfc',
    },
  );
  dio.options = options;
  dio.interceptors.addAll([
    LogInterceptor(),
    RequestInterceptor(),
    ResponseInterceptor(),
    ErrorInterceptor(),
  ]);
  return dio;
}
