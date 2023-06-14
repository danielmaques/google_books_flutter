import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_books/module/home/ui/page/home_page.dart';
import 'package:google_books/module/routes.dart';

import 'module/home/data/datasources/book_datasource_impl.dart';
import 'module/home/domain/usecase/book_usecase.dart';
import 'module/home/ui/bloc/seach_book_bloc.dart';

void main() {
  return runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory<Dio>((i) => Dio()),
        Bind.factory((i) => BookDatasourceImpl(i())),
        Bind.factory((i) => BookUseCase(i())),
        Bind.factory<IBookSearchBloc>((i) => BookSearchBloc(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Routes.rootRoute, child: (context, args) => const HomePage()),
      ];
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'My Smart App',
      theme: ThemeData(primarySwatch: Colors.blue),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
