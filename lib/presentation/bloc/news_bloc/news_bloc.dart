import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:newswave_app/domain/entities/news.dart';
import 'package:newswave_app/domain/usecases/get_all_news.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final GetAllNewsUseCase getAllNewsUseCase;

  NewsBloc(this.getAllNewsUseCase) : super(NewsInitial()) {
    on<NewsEvent>((event, emit) async {
      emit(NewsLoading());
      final failureOrSuccess = await getAllNewsUseCase.call();

      failureOrSuccess.fold(
        (failure) => emit(NewsError("Failed to fetch news")),
        (newsList) => emit(NewsSuccess(newsList)),
      );
    });
  }
}
