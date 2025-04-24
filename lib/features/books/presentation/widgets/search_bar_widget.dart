// ignore_for_file: must_be_immutable

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nagwa_books/features/books/presentation/cubit/books_cubit.dart';
import 'package:nagwa_books/widgets/custom_text_field.dart';

class SearchBarWidget extends StatelessWidget {
  SearchBarWidget({super.key});

  final TextEditingController _controller = TextEditingController();
  Timer? _debounce;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: _controller,
      isRequired: false,
      hintText: 'Search books...',
      textInputAction: TextInputAction.search,
      prefixIcon: Icons.search,
      suffixIcon: IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          if (_controller.text.isEmpty) return;
          _controller.clear();
          _debounce?.cancel(); // Cancel any ongoing debounce
          context.read<BooksCubit>().resetSearch();
        },
      ),
      onChange: (query) {
        //* Debounce the search input to avoid too many requests
        if (_debounce?.isActive ?? false) _debounce!.cancel();
        _debounce = Timer(const Duration(milliseconds: 300), () {
          if (query.trim().isNotEmpty) {
            context.read<BooksCubit>().searchBooks(query.trim());
          } else {
            context.read<BooksCubit>().resetSearch();
          }
        });
      },
      onSubmitted: (query) {
        if (query.trim().isNotEmpty) {
          context.read<BooksCubit>().searchBooks(query.trim());
        }
      },
    );
  }
}
