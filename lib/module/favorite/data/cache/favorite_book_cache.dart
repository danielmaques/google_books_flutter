import 'dart:convert';

import 'package:google_books/module/home/data/model/book_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class BookCache {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDb();
    return _database!;
  }

  Future<Database> _initDb() async {
    String path = join(await getDatabasesPath(), 'favorite_books.db');
    try {
      Database database = await openDatabase(
        path,
        version: 1,
        onCreate: (Database db, int version) async {
          await db.execute("CREATE TABLE favorite_books(id TEXT PRIMARY KEY, book TEXT)");
        },
      );
      return database;
    } catch (e) {
      print('Erro ao abrir o banco de dados: $e');
      rethrow;
    }
  }

  Future<void> saveBook(Items book) async {
    final db = await database;
    try {
      final bookJson = book.toJson();
      final bookString = jsonEncode(bookJson);
      await db.insert(
        'favorite_books',
        {'id': book.id, 'book': bookString},
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      print('Erro ao salvar o livro no banco de dados: $e');
      rethrow;
    }
  }

  Future<void> removeBook(String bookId) async {
    final db = await database;
    await db.delete(
      'favorite_books',
      where: "id = ?",
      whereArgs: [bookId],
    );
  }

  Future<bool> isBookFavorite(String bookId) async {
    final db = await database;
    final maps = await db.query(
      'favorite_books',
      where: "id = ?",
      whereArgs: [bookId],
    );
    return maps.isNotEmpty;
  }

  Future<List<Items>> getFavoriteBooks() async {
    final db = await database;
    final maps = await db.query('favorite_books');
    return List<Items>.from(maps.map((map) {
      final bookString = map['book'] as String;
      final bookJson = jsonDecode(bookString);
      return Items.fromJson(bookJson);
    }));
  }

  Future<void> toggleFavorite(Items book) async {
    if (await isBookFavorite(book.id!)) {
      await removeBook(book.id!);
    } else {
      await saveBook(book);
    }
  }
}
