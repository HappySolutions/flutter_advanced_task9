import 'package:dio/dio.dart';

abstract class DioService {
  static final _baseOptions =
      BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com/');
  static Dio dio = Dio(_baseOptions);
}
