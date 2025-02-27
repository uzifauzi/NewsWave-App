import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:newswave_app/domain/entities/news.dart';
import 'package:newswave_app/domain/usecases/get_tech_news.dart';

part 'tech_news_event.dart';
part 'tech_news_state.dart';

class TechNewsBloc extends Bloc<TechNewsEvent, TechNewsState> {
  final GetTechNewsUsecase getTechNewsUsecase;

  TechNewsBloc(this.getTechNewsUsecase) : super(TechNewsInitial()) {
    on<TechNewsEvent>((event, emit) async {
      emit(TechNewsLoading());

      final failureOrSuccess = await getTechNewsUsecase.call();

      failureOrSuccess.fold(
          (failure) => emit(const TechNewsError("Failed to fetch news")),
          (techNewsList) => emit(TechNewsSuccess(techNewsList)));
    });
  }
}
