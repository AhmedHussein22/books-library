import 'package:nagwa_books/features/books/data/datasources/books_local_data_source.dart';
import 'package:nagwa_books/features/books/data/datasources/books_remote_data_source.dart';
import 'package:nagwa_books/features/books/data/models/book_model.dart';
import 'package:nagwa_books/features/books/domain/repositories/books_repository.dart';

class BooksRepositoryImpl implements BooksRepository {
  final BooksRemoteDataSource remoteDataSource;
  final BooksLocalDataSource localDataSource;

  BooksRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

//** fetch books from the remote server
//** if the fetch fails, get the cached books from local storage
  @override
  Future<BookModel> fetchBooks(int page) async {
    try {
      final bookModel = await remoteDataSource.fetchBooks(page);
      await localDataSource.cacheBooks(bookModel, 'books_page_$page');
      return bookModel;
    } catch (e) {
      final cachedBooks = await localDataSource.getCachedBooks('books_page_$page');
      if (cachedBooks != null) {
        return cachedBooks;
      }
      rethrow;
    }
  }

//** search in books in the remote server by query
//** if the search fails, get the cached books from local storage with the same query
  @override
  Future<BookModel> searchBooks(String query, int page) async {
    try {
      final bookModel = await remoteDataSource.searchBooks(query, page);
      await localDataSource.cacheBooks(bookModel, 'search_${query}_page_$page');
      return bookModel;
    } catch (e) {
      final cachedBooks = await localDataSource.getCachedBooks('search_${query}_page_$page');
      if (cachedBooks != null) {
        return cachedBooks;
      }
      rethrow;
    }
  }
}
