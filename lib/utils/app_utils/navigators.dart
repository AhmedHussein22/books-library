import 'package:flutter/cupertino.dart';
import 'package:nagwa_books/resources/app_keys_manager.dart';

//*! Navigators

//* Push new screen
Future<T?> pushNewScreen<T>(Widget widget) {
  return AppKeysManager.navigatorKey.currentState!.push(CupertinoPageRoute(builder: (context) => widget));
}

//* Push new screen with replacement
Future<T?> pushReplacementScreen<T>(Widget widget) {
  return AppKeysManager.navigatorKey.currentState!.pushReplacement(CupertinoPageRoute(builder: (context) => widget));
}

//* push And RemoveUntil Screen
Future<T?> pushAndRemoveUntilScreen<T>(Widget widget) {
  return AppKeysManager.navigatorKey.currentState!.pushAndRemoveUntil(CupertinoPageRoute(builder: (context) => widget), (route) => false);
}

//* Pop screen
void popRoute() {
  if (AppKeysManager.navigatorKey.currentState!.canPop()) {
    AppKeysManager.navigatorKey.currentState!.pop();
  }
}

//*  push Replacement Screen Without Animation
Future<T?> pushReplacementScreenWithoutAnimation<T>(Widget widget) {
  return AppKeysManager.navigatorKey.currentState!.pushReplacement(
    PageRouteBuilder(
      pageBuilder: (context, animation1, animation2) => widget,
      transitionDuration: Duration.zero,
      reverseTransitionDuration: Duration.zero,
    ),
  );
}

//* push New Screen Without Animation
Future<T?> pushNewScreenWithoutAnimation<T>(Widget widget) {
  return AppKeysManager.navigatorKey.currentState!.push(
    PageRouteBuilder(
      pageBuilder: (context, animation1, animation2) => widget,
      transitionDuration: Duration.zero,
      reverseTransitionDuration: Duration.zero,
    ),
  );
}
