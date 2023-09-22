import 'package:dio/dio.dart';
import 'package:mortalheart_gouyi/models/home_model.dart';
import 'package:mortalheart_gouyi/utils/http/api_response.dart';
import 'package:mortalheart_gouyi/utils/http/app_exceptions.dart';
import 'package:mortalheart_gouyi/utils/http/http.dart';

class HomeApi {
  static const String _article = 'home/queryHomePageInfo';

  static Future<ApiResponse<HomeModel>> getScienceArticle() async {
    try {
      final response =
      await Https.instance.get(_article);
      var data = HomeModel.fromJson(response);
      return ApiResponse.completed(data);
    } on DioException catch (e) {
      return ApiResponse.error(e.error as AppException?);
    }
  }
}