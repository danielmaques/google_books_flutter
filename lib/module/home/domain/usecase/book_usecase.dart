import 'package:google_books/module/home/data/datasources/book_datasource.dart';
import 'package:google_books/module/home/data/model/book_model.dart';

abstract class IBookUseCase {
  Future<List<BooksModel>> searchBooks(String searchText);
}

class BookUseCase implements IBookUseCase {
  final BookDatasource bookDatasource;

  BookUseCase(this.bookDatasource);

  @override
  Future<List<BooksModel>> searchBooks(String searchText) {
    return bookDatasource.searchBooks(searchText);
  }
}
