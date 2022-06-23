import 'package:dio/dio.dart';
import 'package:dio_http_formatter/dio_http_formatter.dart';
import 'package:flutter_state_management/app/data/network/common_repository.dart';
import 'package:flutter_state_management/app/modules/home/homeData/repository/request/rest_client.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';

final sl = GetIt.I;

Future<void> init() async {
  sl.registerLazySingleton<Dio>(() {
    var options = BaseOptions(
      baseUrl: 'https://reqres.in/api/',
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );

    var dio = Dio(options);
    dio.interceptors.add(HttpFormatter(
        logger: Logger(
            printer: PrettyPrinter(
                methodCount: 0,
                colors: true,
                printTime: true,
                printEmojis: false))));
    // dio.interceptors.add(PrettyDioLogger(
    //     requestHeader: true,
    //     requestBody: true,
    //     responseBody: true,
    //     responseHeader: false,
    //     error: true,
    //     compact: true,
    //     maxWidth: 90));
    // dio.interceptors.add(CurlLoggerDioInterceptor());

    return dio;
  });

  sl.registerLazySingleton(() => CommonRepository());
  sl.registerLazySingleton(() => GetStorage("MyApp"));
}
