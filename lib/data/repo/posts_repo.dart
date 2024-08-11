import 'package:flutter_advanced_task9/data/models/call_result_model.dart';
import 'package:flutter_advanced_task9/services/dio_service.dart';

abstract class PostsRepo {
  static Future<CallResult> getPosts() async {
    try {
      var response = await DioService.dio.get('posts');
      if ((response.statusCode ?? 0) >= 200 &&
          (response.statusCode ?? 0) < 299) {
        return CallResult(
            status: response.statusCode!,
            statusMessage: response.statusMessage!,
            data: response.data,
            error: '');
      } else {
        return CallResult(
            status: response.statusCode!,
            statusMessage: '',
            data: null,
            error: 'Error : ${response.statusCode!}');
      }
    } catch (e) {
      return CallResult(status: 500, statusMessage: '', data: null, error: '');
    }
  }
}
