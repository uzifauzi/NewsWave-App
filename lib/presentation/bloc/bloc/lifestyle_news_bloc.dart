import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:newswave_app/domain/usecases/get_lifestyle_news.dart';

import '../../../domain/entities/news.dart';

part 'lifestyle_news_event.dart';
part 'lifestyle_news_state.dart';

class LifestyleNewsBloc extends Bloc<LifestyleNewsEvent, LifestyleNewsState> {
  final GetLifestyleNewsUsecase getLifestyleNewsUsecase;

  LifestyleNewsBloc(this.getLifestyleNewsUsecase)
      : super(LifestyleNewsInitial()) {
    on<LifestyleNewsEvent>((event, emit) async {
      emit(LifestyleNewsLoading());

      final failureOrSuccess = await getLifestyleNewsUsecase.call();

      failureOrSuccess.fold(
          (failure) =>
              emit(const LifestyleNewsError("Failed to fetch lifestyle news")),
          (lifestyleNewsLift) => emit(LifestyleNewsSuccess(lifestyleNewsLift)));
    });
  }
}
