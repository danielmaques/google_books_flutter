import 'package:flutter/material.dart';
import 'package:google_books/module/home/data/model/book_model.dart';

class Book extends StatelessWidget {
  const Book({
    Key? key,
    required this.bookInfo,
  }) : super(key: key);

  final Items bookInfo;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: NetworkImage(
                bookInfo.volumeInfo!.imageLinks!.thumbnail.toString(),
              ),
              fit: BoxFit.fill,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          bookInfo.volumeInfo!.title!,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'paginas ${bookInfo.volumeInfo!.pageCount.toString()}',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
