import 'package:dartz/dartz.dart';
import 'package:newswave_app/domain/entities/news.dart';
import 'package:newswave_app/domain/repositories/news_repository.dart';

import '../../core/failure.dart';

class GetSaveNews {
  final NewsRepository repository;

  GetSaveNews(this.repository);

  Future<Either<Failure, List<News>>> execute() {
    return repository.getBookmarkNews();
  }
}
