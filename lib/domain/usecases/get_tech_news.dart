import 'package:dartz/dartz.dart';
import 'package:newswave_app/core/failure.dart';
import 'package:newswave_app/core/usecase.dart';
import 'package:newswave_app/domain/entities/news.dart';
import 'package:newswave_app/domain/repositories/news_repository.dart';

class GetTechNewsUsecase extends Usecase<List<News>, void> {
  final NewsRepository newsRepository;

  GetTechNewsUsecase(this.newsRepository);

  @override
  Future<Either<Failure, List<News>>> call({void params}) {
    return newsRepository.getTechNews();
  }
}
