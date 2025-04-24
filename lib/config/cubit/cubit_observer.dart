import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nagwa_books/utils/app_utils/app_logs.dart';

class DebugCubitObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    AppLogs.infoLog('Cubit Created: ${bloc.runtimeType}', 'Cubit Created ==>');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    AppLogs.infoLog('Event: $event', 'Event ==>');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    AppLogs.infoLog('State Change in ${bloc.runtimeType}: $change', 'State Change ==>');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    AppLogs.infoLog('Error in ${bloc.runtimeType}: $error', 'Error ==>');
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    AppLogs.infoLog('Cubit Closed: ${bloc.runtimeType}, ', 'Cubit Closed ==>');
  }
}
