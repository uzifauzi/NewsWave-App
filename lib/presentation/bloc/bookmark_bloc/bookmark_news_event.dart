part of 'bookmark_news_bloc.dart';

sealed class BookmarkNewsEvent extends Equatable {
  const BookmarkNewsEvent();

  @override
  List<Object> get props => [];
}

// Event untuk menyimpan berita ke bookmark
class SaveBookmarkNews extends BookmarkNewsEvent {
  final News news;
  const SaveBookmarkNews(this.news);
}

// Event untuk menghapus berita dari bookmark
class RemoveBookmarkNews extends BookmarkNewsEvent {
  final News news;
  const RemoveBookmarkNews(this.news);
}

// Event untuk mengambil semua berita yang telah di-bookmark
class FetchBookmarkNews extends BookmarkNewsEvent {}
