import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_books/module/home/data/model/book_model.dart';

class Book extends StatefulWidget {
  const Book({
    Key? key,
    required this.bookInfo,
  }) : super(key: key);

  final Items bookInfo;

  @override
  State<Book> createState() => _BookState();
}

class _BookState extends State<Book> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Modular.to.pushNamed(
          '/bookInfo',
          arguments: {'bookInfo': widget.bookInfo},
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          widget.bookInfo.volumeInfo!.imageLinks!.thumbnail != null
              ? Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: NetworkImage(
                          widget.bookInfo.volumeInfo!.imageLinks!.thumbnail.toString(),
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                )
              : const CircularProgressIndicator(),
          const SizedBox(height: 8),
          Text(
            widget.bookInfo.volumeInfo!.title!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'paginas ${widget.bookInfo.volumeInfo!.pageCount.toString()}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                },
                child: Container(
                  color: Colors.transparent,
                  child: Icon(
                    Icons.star,
                    color: isFavorite ? Colors.amber : Colors.grey,
                    size: 28,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
