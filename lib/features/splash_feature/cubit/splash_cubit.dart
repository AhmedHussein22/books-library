import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nagwa_books/features/books/presentation/cubit/books_cubit.dart';
import 'package:nagwa_books/features/books/presentation/pages/books_page.dart';
import 'package:nagwa_books/features/splash_feature/cubit/splash_state.dart';
import 'package:nagwa_books/services/setup_dependency_injection.dart';
import 'package:nagwa_books/utils/app_utils/navigators.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashState());

  void navigateToNextScreen() {
    pushAndRemoveUntilScreen(BlocProvider<BooksCubit>(
      create: (context) => sl<BooksCubit>(),
      child: const BooksPage(),
    ));
  }
}
