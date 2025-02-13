import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:newswave_app/domain/entities/news.dart';
import 'package:newswave_app/domain/usecases/get_sports_news.dart';

part 'sports_news_event.dart';
part 'sports_news_state.dart';

class SportsNewsBloc extends Bloc<SportsNewsEvent, SportsNewsState> {
  final GetSportsNewsUseCase getSportsNewsUseCase;

  SportsNewsBloc(this.getSportsNewsUseCase) : super(SportsNewsInitial()) {
    on<SportsNewsEvent>((event, emit) async {
      emit(SportsNewsLoading());

      final failureOrSuccess = await getSportsNewsUseCase.call();

      failureOrSuccess.fold(
          (failure) => emit(const SportsNewsError("Failed to fetch news")),
          (sportsNewsList) => emit(SportsNewsSuccess(sportsNewsList)));
    });
  }
}
