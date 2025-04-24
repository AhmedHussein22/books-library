import 'package:nagwa_books/features/books/data/models/book_model.dart';
import 'package:nagwa_books/features/books/domain/repositories/books_repository.dart';

class FetchBooksUseCase {
  final BooksRepository repository;

  FetchBooksUseCase(this.repository);

//* call method mean that this class is callable
//* so you can use it like this: await fetchBooksUseCase(page);
  Future<BookModel> call(int page) async {
    return await repository.fetchBooks(page);
  }
}
