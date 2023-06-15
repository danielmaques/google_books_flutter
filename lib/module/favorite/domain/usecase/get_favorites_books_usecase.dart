import 'package:google_books/module/favorite/data/cache/favorite_book_cache.dart';
import 'package:google_books/module/home/data/model/book_model.dart';

abstract class IGetFavoriteBooksUseCase {
  Future<List<Items>> execute();
}

class GetFavoriteBooksUseCase implements IGetFavoriteBooksUseCase {
  final BookCache bookCache;

  GetFavoriteBooksUseCase(this.bookCache);

  @override
  Future<List<Items>> execute() async {
    return await bookCache.getFavoriteBooks();
  }
}
