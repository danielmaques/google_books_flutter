import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_books/core/states/base_page_state.dart';
import 'package:google_books/module/home/data/model/book_model.dart';
import 'package:google_books/module/home/ui/bloc/seach_book_bloc.dart';
import 'package:google_books/module/home/ui/widgets/book_widget.dart';
import 'package:google_books/module/home/ui/widgets/seach_bar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late IBookSearchBloc bookSearchBloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    bookSearchBloc = Modular.get<BookSearchBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
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
              SearchBar(onChanged: (value) {
                bookSearchBloc.searchBook(value.toString());
              }),
              const SizedBox(height: 20),
              BlocBuilder(
                bloc: bookSearchBloc,
                builder: (context, state) {
                  if (state is SuccessState) {
                    final book = (state as SuccessState<BooksModel>).data.items!;
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 200,
                      ),
                      itemCount: book.length,
                      itemBuilder: (context, index) {
                        return Book(
                          bookInfo: book[index],
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
