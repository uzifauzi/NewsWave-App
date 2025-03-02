import 'package:dartz/dartz.dart';
import 'package:newswave_app/core/failure.dart';
import 'package:newswave_app/core/usecase.dart';
import 'package:newswave_app/domain/repositories/news_repository.dart';

import '../entities/news.dart';

class GetLifestyleNewsUsecase extends Usecase<List<News>, void> {
  final NewsRepository newsRepository;

  GetLifestyleNewsUsecase(this.newsRepository);

  @override
  Future<Either<Failure, List<News>>> call({void params}) {
    return newsRepository.getLifestyleNews();
  }
}
