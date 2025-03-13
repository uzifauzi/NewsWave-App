import 'package:newswave_app/data/models/bookmark_news_model.dart';

import '../../core/exception.dart';
import 'db/database_helper.dart';

abstract class NewsLocalDataSource {
  Future<String> insertBookmarkNews(BookmarkNewsModel news);
  Future<String> removeBookmarkNews(BookmarkNewsModel news);
  Future<BookmarkNewsModel?> getNewsById(int id);
  Future<List<BookmarkNewsModel>> getBookmarkNews();
}

class NewsLocalDataSourceImpl implements NewsLocalDataSource {
  final DatabaseHelper databaseHelper;
  NewsLocalDataSourceImpl({required this.databaseHelper});

  @override
  Future<List<BookmarkNewsModel>> getBookmarkNews() async {
    final result = await databaseHelper.getBookmarkNews();
    return result.map((data) => BookmarkNewsModel.fromMap(data)).toList();
  }

  @override
  Future<BookmarkNewsModel?> getNewsById(int id) async {
    final result = await databaseHelper.getNewsById(id);
    if (result != null) {
      return BookmarkNewsModel.fromMap(result);
    } else {
      return null;
    }
  }

  @override
  Future<String> insertBookmarkNews(BookmarkNewsModel news) async {
    try {
      await databaseHelper.insertBookmarkNews(news);
      return 'Added to Bookmark';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<String> removeBookmarkNews(BookmarkNewsModel news) async {
    try {
      await databaseHelper.removeBookmarkNews(news);
      return 'Removed from bookmarks';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }
}
