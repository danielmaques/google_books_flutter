import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_books/core/states/base_page_state.dart';
import 'package:google_books/module/favorite/ui/bloc/favorite_bloc.dart';
import 'package:google_books/module/home/data/model/book_model.dart';
import 'package:google_books/module/home/ui/widgets/book_widget.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  late IFavoriteBooksBloc favoriteBooksBloc;

  @override
  void initState() {
    super.initState();
    favoriteBooksBloc = Modular.get<FavoriteBooksBloc>();
    favoriteBooksBloc.fetchFavoriteBooks();
  }

  @override
  void dispose() {
    super.dispose();
    favoriteBooksBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => Modular.to.pop(),
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 18,
            color: Colors.black54,
          ),
        ),
        title: const Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Books',
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w800,
                ),
              ),
              TextSpan(
                text: 'Mark',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 32),
        child: SingleChildScrollView(
          child: Column(
            children: [
              BlocBuilder(
                bloc: favoriteBooksBloc,
                builder: (context, state) {
                  if (state is SuccessState<List<Items>>) {
                    final favoriteBooks = state.data;
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 25,
                        mainAxisExtent: 300,
                      ),
                      itemCount: favoriteBooks.length,
                      itemBuilder: (context, index) {
                        return Book(
                          bookInfo: favoriteBooks[index],
                        );
                      },
                    );
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
