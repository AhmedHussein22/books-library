import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nagwa_books/features/books/data/models/book_model.dart';
import 'package:nagwa_books/features/books/domain/usecases/fetch_books_use_case.dart';
import 'package:nagwa_books/features/books/domain/usecases/search_books_use_case.dart';
import 'package:nagwa_books/resources/enums_manager.dart';
import 'package:nagwa_books/utils/app_utils/app_logs.dart';

part 'books_state.dart';

class BooksCubit extends Cubit<BooksState> {
  final FetchBooksUseCase fetchBooksUseCase;
  final SearchBooksUseCase searchBooksUseCase;

  BooksCubit({
    required this.fetchBooksUseCase,
    required this.searchBooksUseCase,
  }) : super(const BooksState());

  int _currentPage = 1;
  String _currentQuery = '';

//************ fetch Books  ************* */
  Future<void> fetchBooks() async {
    if (state.isLoadingMore || state.hasReachedMax) return;

    emit(state.copyWith(isLoading: _currentPage == 1, isLoadingMore: _currentPage > 1));

    try {
      final bookModel = await fetchBooksUseCase(_currentPage);
      final updatedBooks = [...state.books, ...?bookModel.results]; //* Use null-aware spread

      emit(state.copyWith(
        status: ApiStatus.success,
        books: updatedBooks,
        isLoading: false,
        isLoadingMore: false,
        hasReachedMax: bookModel.results?.isEmpty ?? true,
        nextPage: bookModel.next,
      ));

      if (bookModel.results?.isNotEmpty ?? false) _currentPage++;
    } catch (e) {
      emit(state.copyWith(
        status: ApiStatus.error,
        isLoading: false,
        isLoadingMore: false,
        errorMessage: e.toString(),
      ));
      AppLogs.errorLog('Error fetching books: $e');
    }
  }

//***********  search Books ********** */
  Future<void> searchBooks(String query) async {
    if (query.isEmpty || state.isLoadingMore) return;

    _currentQuery = query;
    _currentPage = 1;

    emit(state.copyWith(
      isLoading: true,
      books: [],
      hasReachedMax: false,
    ));

    try {
      final bookModel = await searchBooksUseCase(query, _currentPage);
      emit(state.copyWith(
        status: ApiStatus.success,
        books: bookModel.results ?? [],
        isLoading: false,
        hasReachedMax: bookModel.results?.isEmpty ?? true,
        nextPage: bookModel.next,
      ));

      if (bookModel.results?.isNotEmpty ?? false) _currentPage++;
    } catch (e) {
      emit(state.copyWith(
        status: ApiStatus.error,
        isLoading: false,
        errorMessage: e.toString(),
      ));
      AppLogs.errorLog('Error searching books: $e');
    }
  }

//********* load More Books ************* */
  Future<void> loadMoreBooks() async {
    if (_currentQuery.isEmpty) {
      await fetchBooks();
    } else {
      await searchBooks(_currentQuery);
    }
  }

//********* reset Search ************* */
  void resetSearch() {
    _currentQuery = '';
    _currentPage = 1;
    emit(const BooksState());
    fetchBooks();
  }
}
