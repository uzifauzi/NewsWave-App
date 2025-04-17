part of 'bookmark_news_bloc.dart';

sealed class BookmarkNewsState extends Equatable {
  const BookmarkNewsState();

  @override
  List<Object> get props => [];
}

final class BookmarkNewsInitial extends BookmarkNewsState {}

final class BookmarkNewsLoading extends BookmarkNewsState {}

// State saat berhasil mendapatkan daftar berita yang di-bookmark
class BookmarkNewsLoaded extends BookmarkNewsState {
  final List<News> newsList;
  const BookmarkNewsLoaded(this.newsList);

  @override
  List<Object> get props => [newsList];
}

// State ketika berhasil menyimpan atau menghapus berita dari bookmark
class BookmarkNewsSuccess extends BookmarkNewsState {
  final String message;
  const BookmarkNewsSuccess(this.message);

  @override
  List<Object> get props => [message];
}

// State ketika terjadi error
class BookmarkNewsError extends BookmarkNewsState {
  final String message;
  const BookmarkNewsError(this.message);

  @override
  List<Object> get props => [message];
}
