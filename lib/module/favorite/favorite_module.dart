import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_books/module/favorite/domain/usecase/get_favorites_books_usecase.dart';

import '../favorite/data/cache/favorite_book_cache.dart';
import 'ui/bloc/favorite_bloc.dart';
import 'ui/page/favorite_page.dart';

class FavoriteModule extends Module {
  @override
  final List<Bind<Object>> binds = [
    Bind.factory<IGetFavoriteBooksUseCase>((i) => GetFavoriteBooksUseCase(i())),
    Bind.lazySingleton<IFavoriteBooksBloc>((i) => FavoriteBooksBloc(i())),
    Bind.lazySingleton((i) => BookCache()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (context, args) => const FavoritePage(),
    ),
  ];
}
