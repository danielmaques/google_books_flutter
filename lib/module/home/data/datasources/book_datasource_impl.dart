import 'package:dio/dio.dart';
import 'package:google_books/core/result_wrapper/result_wrapper.dart';
import 'package:google_books/module/home/data/datasources/book_datasource.dart';
import 'package:google_books/module/home/data/model/book_model.dart';

class BookDatasourceImpl implements BookDatasource {
  late Dio dio;

  BookDatasourceImpl(this.dio);

    @override
  Future<Result<BooksModel>> searchBooks(String searchText) async {
    final apiUrl = 'https://www.googleapis.com/books/v1/volumes?q=$searchText';
    final response = await dio.get(apiUrl);

    if (response.statusCode == 200) {
      return ResultSuccess(BooksModel.fromJson(response.data));
    } else {
      throw Exception('Failed to search books');
    }
  }

}
