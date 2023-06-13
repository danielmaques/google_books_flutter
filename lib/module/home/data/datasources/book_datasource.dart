import 'package:google_books/module/home/data/model/book_model.dart';

abstract class BookDatasource {
  Future<List<BooksModel>> searchBooks(String searchText);
}
