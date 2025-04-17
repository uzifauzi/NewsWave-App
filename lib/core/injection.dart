import 'package:get_it/get_it.dart';
import 'package:newswave_app/data/data_source/db/database_helper.dart';
import 'package:newswave_app/domain/usecases/get_lifestyle_news.dart';
import 'package:newswave_app/domain/usecases/get_save_news.dart';
import 'package:newswave_app/domain/usecases/get_sports_news.dart';
import 'package:newswave_app/domain/usecases/get_tech_news.dart';
import 'package:newswave_app/presentation/bloc/lifestyle_bloc/lifestyle_news_bloc.dart';
import 'package:newswave_app/presentation/bloc/sports_bloc/sports_news_bloc.dart';
import 'package:newswave_app/presentation/bloc/tech_bloc/tech_news_bloc.dart';

import '../data/data_source/news_local_datasource.dart';
import '../data/data_source/news_remote_datasource.dart';
import '../data/repository/news_repository_impl.dart';
import '../domain/repositories/news_repository.dart';
import '../domain/usecases/get_all_news.dart';
import '../domain/usecases/remove_news.dart';
import '../domain/usecases/save_news.dart';
import '../presentation/bloc/bookmark_bloc/bookmark_news_bloc.dart';
import '../presentation/bloc/news_bloc/news_bloc.dart';
import 'dio_config.dart';

final di = GetIt.instance;

Future<void> init() async {
  di.registerLazySingleton(() => dio);
  di.registerLazySingleton(() => DatabaseHelper());

  // Register Remote Data Source
  di.registerFactory<NewsRemoteDataSource>(
      () => NewsRemoteDataSourceImpl(dio: di()));

  // Register Local Data Source
  di.registerLazySingleton<NewsLocalDataSource>(
      () => NewsLocalDataSourceImpl(databaseHelper: di()));

  // Register Repository
  di.registerFactory<NewsRepository>(() => NewsRepositoryImpl(
        newsRemoteDataSource: di(),
        newsLocalDataSource: di(),
      )); //error disini

  // Register UseCase
  di.registerFactory(() => GetAllNewsUseCase(di()));
  di.registerFactory(() => GetSportsNewsUseCase(di()));
  di.registerFactory(() => GetTechNewsUsecase(di()));
  di.registerFactory(() => GetLifestyleNewsUsecase(di()));
  di.registerFactory(() => SaveNews(di()));
  di.registerFactory(() => RemoveNews(di()));
  di.registerFactory(() => GetSaveNews(di()));

  // Register Bloc
  di.registerFactory(() => NewsBloc(di()));
  di.registerFactory(() => SportsNewsBloc(di()));
  di.registerFactory(() => TechNewsBloc(di()));
  di.registerFactory(() => LifestyleNewsBloc(di()));
  di.registerFactory(() => BookmarkNewsBloc(
        saveNews: di(),
        removeNews: di(),
        getBookmarkNews: di(),
      ));
}
