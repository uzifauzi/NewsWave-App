import 'package:dartz/dartz.dart';
import 'package:newswave_app/core/exception.dart';
import 'package:newswave_app/core/failure.dart';
import 'package:newswave_app/data/data_source/news_local_datasource.dart';
import 'package:newswave_app/data/data_source/news_remote_datasource.dart';
import 'package:newswave_app/data/models/bookmark_news_model.dart';
import 'package:newswave_app/domain/entities/news.dart';
import 'package:newswave_app/domain/repositories/news_repository.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsRemoteDataSource newsRemoteDataSource;
  final NewsLocalDataSource newsLocalDataSource;

  NewsRepositoryImpl(
      {required this.newsRemoteDataSource, required this.newsLocalDataSource});
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

  @override
  Future<Either<Failure, List<News>>> getTechNews() async {
    try {
      final result = await newsRemoteDataSource.getTechNews();
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServiceException {
      return const Left(ServerFailure('Cannot connect to server.'));
    }
  }

  @override
  Future<Either<Failure, List<News>>> getLifestyleNews() async {
    try {
      final result = await newsRemoteDataSource.getLifestyleNews();
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServiceException {
      return const Left(ServerFailure('Cannot connect to server.'));
    }
  }

  @override
  Future<Either<Failure, String>> saveBookmarkNews(News news) async {
    try {
      final bookmarkNews = BookmarkNewsModel(
        articleId: news.articleId,
        title: news.title,
        link: news.link,
        imageUrl: news.imageUrl,
        sourceName: news.sourceName,
        pubDate: news.pubDate?.toIso8601String(), // Konversi DateTime ke String
        category: news.category, // List<String> tetap sama
      );
      final result = await newsLocalDataSource.insertBookmarkNews(bookmarkNews);
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<Failure, List<News>>> getBookmarkNews() async {
    final result = await newsLocalDataSource.getBookmarkNews();
    return Right(result.map((data) => data.toEntity()).toList());
  }

  @override
  Future<bool> isAddedToBookmark(int id) async {
    final result = await newsLocalDataSource.getNewsById(id);
    return result != null;
  }

  @override
  Future<Either<Failure, String>> removeBookmarkews(News news) async {
    try {
      final bookmarkNews = BookmarkNewsModel(
        articleId: news.articleId,
        title: news.title,
        link: news.link,
        imageUrl: news.imageUrl,
        sourceName: news.sourceName,
        pubDate: news.pubDate?.toIso8601String(), // Konversi DateTime ke String
        category: news.category, // List<String> tetap sama
      );
      final result = await newsLocalDataSource.removeBookmarkNews(bookmarkNews);
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      rethrow;
    }
  }
}
