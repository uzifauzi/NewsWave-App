import 'package:dartz/dartz.dart';
import 'package:newswave_app/core/exception.dart';
import 'package:newswave_app/core/failure.dart';
import 'package:newswave_app/data/data_source/news_remote_datasource.dart';
import 'package:newswave_app/domain/entities/news.dart';
import 'package:newswave_app/domain/repositories/news_repository.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsRemoteDataSource newsRemoteDataSource;

  NewsRepositoryImpl({required this.newsRemoteDataSource});
  @override
  Future<Either<Failure, List<News>>> getAllNews() async {
    try {
      final result = await newsRemoteDataSource.getAllNews();
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServiceException {
      return const Left(ServerFailure('Cannot connect to server.'));
    }
  }

  @override
  Future<Either<Failure, List<News>>> getSportsNews() async {
    try {
      final result = await newsRemoteDataSource.getSportsNews();
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServiceException {
      return const Left(ServerFailure('Cannot connect to server.'));
    }
  }
}
