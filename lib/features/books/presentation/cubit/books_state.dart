part of 'books_cubit.dart';

class BooksState extends Equatable {
  const BooksState({
    this.status = ApiStatus.idle,
    this.books = const [],
    this.isLoading = false,
    this.isLoadingMore = false,
    this.hasReachedMax = false,
    this.errorMessage = '',
    this.nextPage,
  });

  final ApiStatus status;
  final List<Result> books;
  final bool isLoading;
  final bool isLoadingMore;
  final bool hasReachedMax;
  final String errorMessage;
  final String? nextPage;

  BooksState copyWith({
    ApiStatus? status,
    List<Result>? books,
    bool? isLoading,
    bool? isLoadingMore,
    bool? hasReachedMax,
    String? errorMessage,
    String? nextPage,
  }) {
    return BooksState(
      status: status ?? this.status,
      books: books ?? this.books,
      isLoading: isLoading ?? this.isLoading,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      errorMessage: errorMessage ?? this.errorMessage,
      nextPage: nextPage ?? this.nextPage,
    );
  }

  @override
  List<Object?> get props => [status, books, isLoading, isLoadingMore, hasReachedMax, errorMessage, nextPage];
}
