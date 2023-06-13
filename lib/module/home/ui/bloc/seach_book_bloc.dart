import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_books/core/states/base_page_state.dart';
import 'package:google_books/module/home/domain/usecase/book_usecase.dart';

abstract class IBookSeachBloc {
  Future<void> seachBook(String searchText);
}

class BookSeachBloc extends Cubit<BaseState> implements IBookSeachBloc {
  final IBookUseCase _bookUseCase;

  BookSeachBloc(this._bookUseCase) : super(const EmptyState());

  @override
  Future<void> seachBook(String searchText) async {
    emit(const LoadingState());
    final result = await _bookUseCase.searchBooks(searchText);
    try {
      emit(SuccessState(result));
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
