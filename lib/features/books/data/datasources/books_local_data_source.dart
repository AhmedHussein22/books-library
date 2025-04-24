import 'dart:convert';

import 'package:nagwa_books/features/books/data/models/book_model.dart';
import 'package:nagwa_books/services/data_base_service/local_storage/shared_prefs_storage.dart';

abstract class BooksLocalDataSource {
  //* cache books to local storage using shared preferences
  Future<void> cacheBooks(BookModel bookModel, String key);

  //* get cached books from local storage using shared preferences
  Future<BookModel?> getCachedBooks(String key);
}

class BooksLocalDataSourceImpl implements BooksLocalDataSource {
  final SharedPrefsStorage storage;

  BooksLocalDataSourceImpl({required this.storage});

  @override
  Future<void> cacheBooks(BookModel bookModel, String key) async {
    final jsonString = jsonEncode(bookModel.toJson());
    //** cache the book model to local storage
    //** the key is the books_page_$page
    await SharedPrefsStorage.set(key, jsonString);
  }

  @override
  Future<BookModel?> getCachedBooks(String key) async {
    //** get the cached book model from local storage
    //** the key is the books_page_$page
    //** if the key is not found, return null
    final jsonString = SharedPrefsStorage.get(key);
    if (jsonString != null && jsonString is String) {
      return BookModel.fromJson(jsonDecode(jsonString));
    }
    return null;
  }
}
