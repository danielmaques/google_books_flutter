import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_books/module/home/ui/bloc/seach_book_bloc.dart';
import 'package:google_books/module/home/ui/widgets/seach_bar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late IBookSeachBloc bookSeachBloc;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    bookSeachBloc = Modular.get();
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
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Column(
          children: [
            SearchBar(onChanged: (value) {
              bookSeachBloc.seachBook(value.toString());
            }),
            SingleChildScrollView(
              child: Column(),
            ),
          ],
        ),
      ),
    );
  }
}
