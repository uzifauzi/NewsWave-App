import 'package:newswave_app/data/models/bookmark_news_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;

  Future<Database?> get database async {
    _database ??= await _initDb();
    return _database;
  }

  static const String _tblBookmarkNews = 'bookmark_news';

  Future<Database> _initDb() async {
    final path = await getDatabasesPath();
    final databasePath = join(path, 'newswave.db');

    var db = await openDatabase(databasePath, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE  $_tblBookmarkNews (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        article_id TEXT NOT NULL,
        title TEXT,
        link TEXT,
        image_url TEXT,
        source_name TEXT,
        pub_date TEXT,
        category TEXT
      );
    ''');
  }

  Future<int> insertBookmarkNews(BookmarkNewsModel news) async {
    final db = await database;
    final result = await db!.insert(_tblBookmarkNews, news.toMap());

    print('Inserted bookmark news: ${news.toMap()}');
    print('Insert result: $result'); // Harus lebih dari 0 jika berhasil

    return result;
  }

  Future<int> removeBookmarkNews(BookmarkNewsModel news) async {
    final db = await database;
    return await db!.delete(
      _tblBookmarkNews,
      where: 'id = ?',
      whereArgs: [news.id],
    );
  }

  Future<Map<String, dynamic>?> getNewsById(int id) async {
    final db = await database;
    final results = await db!.query(
      _tblBookmarkNews,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (results.isNotEmpty) {
      return results.first;
    } else {
      return null;
    }
  }

  Future<List<Map<String, dynamic>>> getBookmarkNews() async {
    final db = await database;
    final List<Map<String, dynamic>> results =
        await db!.query(_tblBookmarkNews);

    print('Fetched bookmark news: $results');
    return results;
  }
}
