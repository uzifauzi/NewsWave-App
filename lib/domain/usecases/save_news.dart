import 'package:dartz/dartz.dart';
import 'package:newswave_app/domain/entities/news.dart';
import 'package:newswave_app/domain/repositories/news_repository.dart';

import '../../core/failure.dart';

class SaveNews {
  final NewsRepository repository;

  SaveNews(this.repository);

  Future<Either<Failure, String>> execute(News news) {
    return repository.saveBookmarkNews(news);
  }
}
