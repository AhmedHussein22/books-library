import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nagwa_books/features/books/presentation/cubit/books_cubit.dart';
import 'package:nagwa_books/features/books/presentation/widgets/book_list_item_widget.dart';
import 'package:nagwa_books/features/books/presentation/widgets/search_bar_widget.dart';
import 'package:nagwa_books/resources/enums_manager.dart';
import 'package:nagwa_books/utils/app_utils/extensions_methods.dart';
import 'package:nagwa_books/widgets/custom_error_widget.dart';
import 'package:nagwa_books/widgets/custom_loading_widget.dart';
import 'package:nagwa_books/widgets/custom_no_data_widget.dart';
import 'package:nagwa_books/widgets/custom_scaffold.dart';

class BooksPage extends StatefulWidget {
  const BooksPage({super.key});

  @override
  State<BooksPage> createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    //** add listener to the scroll controller to load more books when the user scrolls to the bottom of the list
    _scrollController.addListener(_onScroll);
    context.read<BooksCubit>().fetchBooks();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  //** load more books when the user scrolls to the bottom of the list  - 200 pixels from the bottom
  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200.h) {
      context.read<BooksCubit>().loadMoreBooks();
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffoldWidget(
      title: 'Books Library',
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //** search bar widget to search in books **
          SearchBarWidget(),
          //** books list widget **
          Expanded(
            child: BlocBuilder<BooksCubit, BooksState>(
              builder: (context, state) {
                if (state.status == ApiStatus.idle || (state.isLoading && state.books.isEmpty)) {
                  return const CustomSpinKitLoadingWidget();
                }

                if (state.status == ApiStatus.error && state.books.isEmpty) {
                  return CustomErrorWidget(
                    message: state.errorMessage,
                    onRetry: () {
                      context.read<BooksCubit>().fetchBooks();
                    },
                  );
                }
                if (state.status == ApiStatus.success && state.books.isEmpty) {
                  return CustomNoDataWidget(message: 'No books found');
                }

                return RefreshIndicator.adaptive(
                  onRefresh: () async {
                    context.read<BooksCubit>().fetchBooks();
                  },
                  child: ListView.builder(
                    controller: _scrollController,
                    padding: 8.vPadding,
                    //* +1 to show the loading indicator at the end of the list
                    itemCount: state.books.length + (state.isLoadingMore ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index == state.books.length && state.isLoadingMore) {
                        return const CustomSpinKitLoadingWidget().allPadding(16);
                      }
                      return AnimatedOpacity(
                        duration: const Duration(milliseconds: 500),
                        opacity: 1.0,
                        child: BookListItemWidget(book: state.books[index]),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
