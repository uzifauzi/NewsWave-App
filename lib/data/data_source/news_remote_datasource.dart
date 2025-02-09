import 'package:dio/dio.dart';
import 'package:newswave_app/core/constant.dart';
import 'package:newswave_app/core/exception.dart';
import 'package:newswave_app/data/models/news_model.dart';
import 'package:newswave_app/data/models/news_response.dart';

abstract class NewsRemoteDataSource {
  Future<List<NewsModel>> getAllNews();
}

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  final Dio dio;

  NewsRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<NewsModel>> getAllNews() async {
    try {
      final response = await dio.get("/news", queryParameters: {
        "apikey": KeyConstant.apiKey,
        "country": KeyConstant.idCountry,
      });

      if (response.statusCode == 200) {
        final newsResponse = NewsResponse.fromJson(response.data);
        return newsResponse.results;
      } else {
        throw ServiceException();
      }
    } on DioException catch (e) {
      throw Exception("Network error: ${e.message}");
    }
  }
}
