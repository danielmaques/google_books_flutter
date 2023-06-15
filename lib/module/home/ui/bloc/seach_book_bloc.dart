import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_books/core/states/base_page_state.dart';
import 'package:google_books/module/home/domain/usecase/book_usecase.dart';

abstract class IBookSearchBloc extends Cubit<BaseState> {
  IBookSearchBloc() : super(const EmptyState());

  Future<void> searchBook(String searchText);
}

class BookSearchBloc extends IBookSearchBloc {
  final IBookUseCase _bookUseCase;

  BookSearchBloc(this._bookUseCase);

  @override
  Future<void> searchBook(String searchText) async {
    emit(const LoadingState());
    try {
      final result = await _bookUseCase.searchBooks(searchText);

      emit(SuccessState(result.data));
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
