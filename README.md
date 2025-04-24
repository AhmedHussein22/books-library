# Nagwa Books

Nagwa Books is a Flutter application that allows users to browse and search for books using the Gutendex API. The app features a responsive UI, offline caching, infinite scrolling, and search functionality, built with Clean Architecture and SOLID principles for maintainability and scalability.

## Features

- **Book List**: Displays a paginated list of books with infinite scrolling.
- **Search**: Allows users to search for books by title or author.
- **Offline Caching**: Caches book data (general list and search results) using `shared_preferences` to display data when offline or if API requests fail.
- **Responsive UI**: Adapts to different screen sizes using `flutter_screenutil`.
- **Shimmer Effect**: Uses `skeletonizer` for a smooth loading experience.
- **Flavors**: Supports dev and prod flavors for development and production environments.
- **Splash Screen**: Custom splash screen configured with `flutter_native_splash`.
- **State Management**: Uses `flutter_bloc` for efficient state management.
- **Dependency Injection**: Implements `get_it` for service locator pattern.

## Technologies

- **Flutter**: SDK version `>=3.3.0 <4.0.0` (Flutter 3.22.3)
- **Dart**: For core programming
- **Gutendex API**: For fetching book data
- **Dependencies**:
  - `dio`: For network requests
  - `shared_preferences`: For offline caching
  - `flutter_bloc`: For state management
  - `get_it`: For dependency injection
  - `equatable`: For value equality
  - `flutter_screenutil`: For responsive UI
  - `cached_network_image`: For image caching
  - `skeletonizer`: For shimmer effects
  - `flutter_spinkit`: For loading spinners
  - `flutter_flavorizr`: For managing flavors
  - `flutter_native_splash`: For splash screen
  - `cupertino_icons`: For iOS-style icons
  - `device_preview`: For previewing on different devices

## Project Structure

The project follows Clean Architecture with three main layers:

1. **Presentation Layer**: Contains UI components (`BooksPage`, `BookListItemWidget`, `SearchBarWidget`) and state management (`BooksCubit`).
2. **Domain Layer**: Includes entities (`Book`), use cases (`FetchBooksUseCase`, `SearchBooksUseCase`), and repository interfaces (`BooksRepository`).
3. **Data Layer**: Handles data operations with models (`BookModel`), repositories (`BooksRepositoryImpl`), and data sources (`BooksRemoteDataSource`, `BooksLocalDataSource`).

## Key Files

- `lib/main_dev.dart`: Entry point for the dev flavor.
- `lib/main_prod.dart`: Entry point for the prod flavor.
- `lib/features/books/domain/entities/book.dart`: Pure entity representing a book.
- `lib/features/books/data/models/book_model.dart`: Data model for API responses with JSON parsing.
- `lib/services/data_base_service/local_storage/shared_prefs_storage.dart`: Handles caching with `shared_preferences`.
- `lib/services/setup_locator.dart`: Configures dependency injection.

## Setup Instructions

### Prerequisites

- **Flutter**: Version 3.22.3 or compatible (`>=3.3.0 <4.0.0`)
- **Dart**: Included with Flutter
- **IDE**: VS Code, Android Studio, or IntelliJ IDEA
- **Dependencies**: Ensure you have `flutter_flavorizr` and `flutter_native_splash` installed globally (or run `flutter pub get` to install project dependencies).

### Installation

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/AhmedHussein22/books-library
   cd nagwa_books
   ```

2. **Install Dependencies**:
   ```bash
   flutter pub get
   ```

3. **Run the App**:
   - For dev flavor (debug mode):
     ```bash
     flutter run --flavor dev -t lib/main_dev.dart
     ```
   - For prod flavor (release mode):
     ```bash
     flutter run --flavor prod -t lib/main_prod.dart --release
     ```

4. **Build the App**:
   - Build APK for dev flavor:
     ```bash
     flutter build apk --flavor dev --release -t lib/main_dev.dart
     ```
   - Build APK for prod flavor:
     ```bash
     flutter build apk --flavor prod --release -t lib/main_prod.dart
     ```

## Offline Caching

The app implements offline caching using `shared_preferences`:

- **Storage**: Book data (from both general list and search results) is stored as JSON strings in `shared_preferences`.
- **Behavior**: When the device is offline or an API request fails, the app retrieves cached data for the corresponding page or search query.
- **Implementation**: Handled in `BooksLocalDataSourceImpl`, which caches `Book` entities converted from `BookModel` responses.

## Flavors

The app supports two flavors:

- **dev**: Uses `com.Nagwa.task.dev` (Android) and `com.Nagwa.task.dev` (iOS) with a custom app name ("Nagwa Task Dev") and icon.
- **prod**: Uses `com.Nagwa.task` (Android) and `com.Nagwa.task` (iOS) with a custom app name ("Nagwa Task") and icon.

Run the appropriate flavor using the commands above or via the VS Code launch configurations in `.vscode/launch.json`.

## Architecture Details

### Clean Architecture:

- **Use Cases**: `FetchBooksUseCase` and `SearchBooksUseCase` encapsulate business logic.
- **Repositories**: `BooksRepository` abstracts data operations, implemented by `BooksRepositoryImpl`.
- **Data Sources**: `BooksRemoteDataSource` (API) and `BooksLocalDataSource` (cache) provide data.

### SOLID Principles:

- **Single Responsibility**: Each class has one responsibility (e.g., `BookModel` for parsing, `Book` for domain logic).
- **Dependency Inversion**: The domain layer depends on abstractions (`BooksRepository`), not implementations.

### State Management:

- `BooksCubit` manages the UI state, handling loading, success, and error states.

### Dependency Injection:

- `get_it` is used to provide dependencies across layers.

## Notes

- **Fonts**: Uses `IBMPlexSans` for consistent typography.
- **Assets**: Includes images, icons, and fonts in the `assets/` directory.
- **API**: Relies on Gutendex API (https://gutendex.com/books) for book data.

## Future Improvements

- Add retry logic for failed API requests.
- Implement animations for smoother UI transitions.
- Add unit tests for use cases and repositories.

## Contact

For any questions or issues, please contact the developer at [ahmed.dve229@gmail.com](mailto:ahmed.dve229@gmail.com).
