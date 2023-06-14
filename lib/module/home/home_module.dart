import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_books/module/home/ui/page/home_page.dart';

import 'data/datasources/book_datasource_impl.dart';
import 'domain/usecase/book_usecase.dart';
import 'ui/bloc/seach_book_bloc.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.factory((i) => BookDatasourceImpl(i())),
        Bind.factory((i) => BookUseCase(i())),
        Bind.factory<IBookSearchBloc>((i) => BookSearchBloc(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const HomePage()),
      ];
}
