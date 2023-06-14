// ignore_for_file: deprecated_member_use

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_books/core/states/base_page_state.dart';
import 'package:google_books/module/home/data/model/book_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../favorite/data/cache/favorite_book_cache.dart';

abstract class IBookInfoBloc extends Cubit<BaseState> {
  IBookInfoBloc() : super(const EmptyState());

  Future<void> url(String url);
  Future<void> favoriteBook(Items book);
  Future<bool> isBookFavorite(String bookId);
  Future<void> saveBook(Items book);
  Future<void> removeBook(String bookId);
}

class BookInfoBloc extends IBookInfoBloc {
  final BookCache bookCache;

  BookInfoBloc(this.bookCache) : super();

  @override
  Future<void> url(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Future<void> favoriteBook(Items book) async {
    final bookId = book.id;

    if (bookId == null) {
      emit(const ErrorState('Book id is null'));
      return;
    }

    try {
      await bookCache.toggleFavorite(book);
      if (await bookCache.isBookFavorite(bookId)) {
        emit(const SuccessState('Livro favoritado.'));
      } else {
        emit(const SuccessState('Livro removido dos favoritos.'));
      }
    } catch (error) {
      emit(ErrorState('Erro ao favoritar o livro: $error'));
    }
  }

  @override
  Future<bool> isBookFavorite(String bookId) async =>
      await bookCache.isBookFavorite(bookId);

  @override
  Future<void> saveBook(Items book) async {
    try {
      await bookCache.saveBook(book);
      emit(const SuccessState('Livro salvo com sucesso.'));
    } catch (error) {
      emit(ErrorState('Erro ao salvar o livro: $error'));
    }
  }

  @override
  Future<void> removeBook(String bookId) async {
    try {
      await bookCache.removeBook(bookId);
      emit(const SuccessState('Livro removido com sucesso.'));
    } catch (error) {
      emit(ErrorState('Erro ao remover o livro: $error'));
    }
  }
}
