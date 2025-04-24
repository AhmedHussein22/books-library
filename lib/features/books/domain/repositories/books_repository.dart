import 'package:nagwa_books/features/books/data/models/book_model.dart';

abstract class BooksRepository {
  Future<BookModel> fetchBooks(int page);
  Future<BookModel> searchBooks(String query, int page);
}
