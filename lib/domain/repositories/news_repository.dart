import 'package:dartz/dartz.dart';
import 'package:newswave_app/core/failure.dart';
import 'package:newswave_app/data/models/bookmark_news_model.dart';
import 'package:newswave_app/domain/entities/news.dart';

abstract class NewsRepository {
  Future<Either<Failure, List<News>>> getAllNews();
  Future<Either<Failure, List<News>>> getSportsNews();
  Future<Either<Failure, List<News>>> getTechNews();
  Future<Either<Failure, List<News>>> getLifestyleNews();
  Future<Either<Failure, String>> saveBookmarkNews(News news);
  Future<Either<Failure, String>> removeBookmarkews(News news);
  Future<bool> isAddedToWatchlist(int id);
  Future<Either<Failure, List<BookmarkNewsModel>>> getWatchlistMovies();
}
