import 'package:dio/dio.dart';

Dio dio() {
  Dio dio = Dio();

  dio.options.baseUrl = "http://10.0.2.2:8000/api";
  dio.options.headers['Accept'] = "application/json";
  dio.options.receiveDataWhenStatusError = true;
  dio.options.followRedirects = false;
  dio.options.validateStatus = (status) => true;
  return dio;
}
