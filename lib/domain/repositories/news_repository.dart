import 'package:dartz/dartz.dart';
import 'package:newswave_app/core/failure.dart';
import 'package:newswave_app/domain/entities/news.dart';

abstract class NewsRepository {
  Future<Either<Failure, List<News>>> getAllNews();
  Future<Either<Failure, List<News>>> getSportsNews();
  Future<Either<Failure, List<News>>> getTechNews();
  Future<Either<Failure, List<News>>> getLifestyleNews();
}
