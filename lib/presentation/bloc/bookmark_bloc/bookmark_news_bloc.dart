import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/news.dart';
import '../../../domain/usecases/get_save_news.dart';
import '../../../domain/usecases/remove_news.dart';
import '../../../domain/usecases/save_news.dart';

part 'bookmark_news_event.dart';
part 'bookmark_news_state.dart';

class BookmarkNewsBloc extends Bloc<BookmarkNewsEvent, BookmarkNewsState> {
  final SaveNews saveNews;
  final RemoveNews removeNews;
  final GetSaveNews getBookmarkNews;

  BookmarkNewsBloc({
    required this.saveNews,
    required this.removeNews,
    required this.getBookmarkNews,
  }) : super(BookmarkNewsInitial()) {
    // Event: Menyimpan berita ke bookmark
    on<SaveBookmarkNews>((event, emit) async {
      emit(BookmarkNewsLoading());
      final result = await saveNews.execute(event.news);

      result.fold(
        (failure) => emit(BookmarkNewsError(failure.message)),
        (message) => emit(BookmarkNewsSuccess(message)),
      );
    });

    // Event: Menghapus berita dari bookmark
    on<RemoveBookmarkNews>((event, emit) async {
      emit(BookmarkNewsLoading());
      final result = await removeNews.execute(event.news);

      result.fold(
        (failure) => emit(BookmarkNewsError(failure.message)),
        (message) => emit(BookmarkNewsSuccess(message)),
      );
    });

    // Event: Mengambil daftar berita yang telah di-bookmark
    on<FetchBookmarkNews>((event, emit) async {
      emit(BookmarkNewsLoading());
      final result = await getBookmarkNews.execute();

      result.fold(
        (failure) => emit(BookmarkNewsError(failure.message)),
        (newsList) => emit(BookmarkNewsLoaded(newsList)),
      );
    });
  }
}
