import 'package:get_it/get_it.dart';
import 'package:nagwa_books/features/books/data/datasources/books_local_data_source.dart';
import 'package:nagwa_books/features/books/data/datasources/books_remote_data_source.dart';
import 'package:nagwa_books/features/books/data/repositories/books_repository_impl.dart';
import 'package:nagwa_books/features/books/domain/repositories/books_repository.dart';
import 'package:nagwa_books/features/books/domain/usecases/fetch_books_use_case.dart';
import 'package:nagwa_books/features/books/domain/usecases/search_books_use_case.dart';
import 'package:nagwa_books/features/books/presentation/cubit/books_cubit.dart';
import 'package:nagwa_books/services/api/dio_consumer.dart';
import 'package:nagwa_books/services/api/network_service.dart';
import 'package:nagwa_books/services/data_base_service/local_storage/shared_prefs_storage.dart';

GetIt sl = GetIt.instance;

void setupLocator() async {
  //********** Services ********** */
  sl.registerLazySingleton(() => SharedPrefsStorage());
  sl.registerLazySingleton(() => DioConsumer());
  sl.registerLazySingleton(() => NetworkService());

  //********** Data Sources ********** */
  sl.registerLazySingleton<BooksRemoteDataSource>(() => BooksRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<BooksLocalDataSource>(() => BooksLocalDataSourceImpl(storage: sl()));

  //********** Repositories ********** */
  sl.registerLazySingleton<BooksRepository>(() => BooksRepositoryImpl(remoteDataSource: sl(), localDataSource: sl()));

  //********** Use Cases ********** */
  sl.registerLazySingleton(() => FetchBooksUseCase(sl()));
  sl.registerLazySingleton(() => SearchBooksUseCase(sl()));

  //********** Cubits ********** */
  sl.registerFactory(() => BooksCubit(fetchBooksUseCase: sl(), searchBooksUseCase: sl()));
}
