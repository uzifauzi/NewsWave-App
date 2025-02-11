import 'package:get_it/get_it.dart';

import '../data/data_source/news_remote_datasource.dart';
import '../data/repository/news_repository_impl.dart';
import '../domain/repositories/news_repository.dart';
import '../domain/usecases/get_all_news.dart';
import '../presentation/bloc/news_bloc/news_bloc.dart';
import 'dio_config.dart';

final di = GetIt.instance;

Future<void> init() async {
  di.registerLazySingleton(() => dio);
  // Register Remote Data Source
  di.registerFactory<NewsRemoteDataSource>(
      () => NewsRemoteDataSourceImpl(dio: di()));

  // Register Repository
  di.registerFactory<NewsRepository>(
      () => NewsRepositoryImpl(newsRemoteDataSource: di()));

  // Register UseCase
  di.registerFactory(() => GetAllNewsUseCase(di()));

  // Register Bloc
  di.registerFactory(() => NewsBloc(di()));
}
