import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_books/module/home/data/datasources/book_datasource_impl.dart';
import 'package:google_books/module/home/domain/usecase/book_usecase.dart';
import 'package:google_books/module/home/ui/bloc/seach_book_bloc.dart';
import 'package:google_books/module/home/ui/page/home_page.dart';
import 'package:google_books/module/routes.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.factory((i) => BookDatasourceImpl(i())),
        Bind.factory((i) => BookUseCase(i())),
        Bind.factory<IBookSeachBloc>((i) => BookSeachBloc(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Routes.homeRoute,
          child: (context, args) => const HomePage(),
        ),
      ];
}
