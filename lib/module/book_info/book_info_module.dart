import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_books/module/book_info/ui/page/book_info_page.dart';

import '../favorite/data/cache/favorite_book_cache.dart';
import 'ui/bloc/book_info_bloc.dart';

class BookInfoModule extends Module {
  @override
  final List<Bind<Object>> binds = [
    Bind.factory<IBookInfoBloc>((i) => BookInfoBloc(i())),
    Bind.factory((i) => BookCache()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (context, args) => BookInfoPage(bookInfo: args.data?['bookInfo']),
    ),
  ];
}
