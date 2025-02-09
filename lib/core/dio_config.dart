import 'package:dio/dio.dart';
import 'package:newswave_app/core/constant.dart';

final options = BaseOptions(
    baseUrl: "https://newsdata.io/api/1",
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 3),
    queryParameters: {
      'apikey': KeyConstant.apiKey,
      'country': KeyConstant.idCountry,
    });

Dio dio = Dio(options);
