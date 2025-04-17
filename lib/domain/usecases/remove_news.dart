import 'package:dartz/dartz.dart';

import '../../core/failure.dart';
import '../entities/news.dart';
import '../repositories/news_repository.dart';

class RemoveNews {
  final NewsRepository repository;

  RemoveNews(this.repository);

  Future<Either<Failure, String>> execute(News news) {
    return repository.removeBookmarkews(news);
  }
}
