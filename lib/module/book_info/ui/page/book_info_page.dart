import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_books/module/book_info/ui/bloc/book_info_bloc.dart';
import 'package:google_books/module/home/data/model/book_model.dart';

class BookInfoPage extends StatefulWidget {
  const BookInfoPage({
    Key? key,
    required this.bookInfo,
  }) : super(key: key);

  final Items bookInfo;

  @override
  State<BookInfoPage> createState() => _BookInfoPageState();
}

class _BookInfoPageState extends State<BookInfoPage> {
  late IBookInfoBloc bookInfoBloc;
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    bookInfoBloc = Modular.get<IBookInfoBloc>();
    bookInfoBloc.isBookFavorite(widget.bookInfo.id!).then((isFavorite) {
      setState(() {
        this.isFavorite = isFavorite;
      });
    });
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
        actions: [
          BlocBuilder(
            bloc: bookInfoBloc,
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.only(right: 16),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      if (isFavorite) {
                        bookInfoBloc.removeBook(widget.bookInfo.id!);
                        isFavorite = false;
                      } else {
                        bookInfoBloc.saveBook(widget.bookInfo);
                        isFavorite = true;
                      }
                    });
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Icon(
                      Icons.bookmark_outlined,
                      color: isFavorite ? Colors.red : Colors.grey,
                      size: 28,
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network(
                      widget.bookInfo.volumeInfo!.imageLinks!.thumbnail!,
                      width: 100,
                    ),
                    TextButton(
                      onPressed: () {
                        bookInfoBloc
                            .url(widget.bookInfo.volumeInfo!.canonicalVolumeLink!);
                      },
                      child: const Text(
                        'Onde Comprar?',
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.bookInfo.volumeInfo!.title!,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Idioma: ${widget.bookInfo.volumeInfo!.language}',
                        style: const TextStyle(color: Colors.black),
                      ),
                      const SizedBox(height: 8),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: widget.bookInfo.volumeInfo!.authors!.length,
                        itemBuilder: (context, index) => Text(
                          widget.bookInfo.volumeInfo!.authors![index],
                        ),
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Descrição',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  widget.bookInfo.volumeInfo!.description!,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
