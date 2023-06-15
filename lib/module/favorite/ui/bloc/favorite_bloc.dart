import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_books/core/states/base_page_state.dart';
import 'package:google_books/module/favorite/domain/usecase/get_favorites_books_usecase.dart';

abstract class IFavoriteBooksBloc extends Cubit<BaseState> {
  IFavoriteBooksBloc() : super(const EmptyState());

  Future<void> fetchFavoriteBooks();
}

class FavoriteBooksBloc extends IFavoriteBooksBloc {
  final IGetFavoriteBooksUseCase _getFavoriteBooksUseCase;

  FavoriteBooksBloc(this._getFavoriteBooksUseCase) : super();

  @override
  Future<void> fetchFavoriteBooks() async {
    try {
      final favoriteBooks = await _getFavoriteBooksUseCase.execute();
      emit(SuccessState(favoriteBooks));
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
