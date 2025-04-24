import 'package:nagwa_books/features/books/data/models/book_model.dart';
import 'package:nagwa_books/features/books/domain/repositories/books_repository.dart';

class SearchBooksUseCase {
  final BooksRepository repository;

  SearchBooksUseCase(this.repository);

  //* call method mean that this class is callable
  //* so you can use it like this: await searchBooksUseCase(query, page);
  Future<BookModel> call(String query, int page) async {
    return await repository.searchBooks(query, page);
  }
}
