import 'package:google_books/core/result_wrapper/result_wrapper.dart';

import '../model/book_model.dart';

abstract class BookDatasource {
  Future<Result<BooksModel>> searchBooks(String searchText);
}
