import 'package:nagwa_books/features/books/data/models/book_model.dart';
import 'package:nagwa_books/resources/enums_manager.dart';
import 'package:nagwa_books/services/api/dio_consumer.dart';
import 'package:nagwa_books/services/api/end_points.dart';

abstract class BooksRemoteDataSource {
  //* fetch books from the remote server
  Future<BookModel> fetchBooks(int page);
  //* search in books in the remote server by query
  Future<BookModel> searchBooks(String query, int page);
}

class BooksRemoteDataSourceImpl implements BooksRemoteDataSource {
  final DioConsumer client;

  BooksRemoteDataSourceImpl({required this.client});

  @override
  Future<BookModel> fetchBooks(int page) async {
    final response = await client.getRequest(
      EndPoints.books,
      queryParameters: {'page': page},
    );

    if (response.status == ApiStatus.success) {
      return BookModel.fromJson(response.data);
    } else {
      throw Exception(response.message);
    }
  }

  @override
  Future<BookModel> searchBooks(String query, int page) async {
    final response = await client.getRequest(
      EndPoints.books,
      queryParameters: {'search': query, 'page': page},
    );

    if (response.status == ApiStatus.success) {
      return BookModel.fromJson(response.data);
    } else {
      throw Exception(response.message);
    }
  }
}
