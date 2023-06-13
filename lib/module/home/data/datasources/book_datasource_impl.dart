import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:google_books/module/home/data/datasources/book_datasource.dart';
import 'package:google_books/module/home/data/model/book_model.dart';

class BookDatasourceImpl implements BookDatasource {
  late Dio dio;

  BookDatasourceImpl(this.dio);

  @override
  Future<List<BooksModel>> searchBooks(String searchText) async {
    final apiUrl = 'https://www.googleapis.com/books/v1/volumes?q=$searchText';
    final response = await dio.get(apiUrl);

    if (response.statusCode == 200) {
      final jsonResult = json.decode(response.data);
      final List<dynamic> items = jsonResult['items'];
      final List<BooksModel> books =
          items.map((item) => BooksModel.fromJson(item as Map<String, dynamic>)).toList();

      return books;
    } else {
      throw Exception('Failed to search books');
    }
  }
}
