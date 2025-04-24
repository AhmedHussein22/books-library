import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nagwa_books/resources/app_strings_manager.dart';
import 'package:nagwa_books/services/data_base_service/local_storage/shared_prefs_storage.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<ChangeLocaleState> {
  LocaleCubit() : super(ChangeLocaleState(locale: const Locale('ar', '')));

  Future<void> getSavedLanguage() async {
    final langCode = SharedPrefsStorage.get(SharedPrefsKeys.languageCode) ?? AppStringsManager.arabicCode;
    emit(ChangeLocaleState(locale: Locale(langCode)));
  }

  Future<void> changeLanguage(String languageCode) async {
    final currentlyCode = SharedPrefsStorage.get(SharedPrefsKeys.languageCode);
    if (currentlyCode == languageCode) {
      return;
    }
    await SharedPrefsStorage.set(SharedPrefsKeys.languageCode, languageCode);
    emit(ChangeLocaleState(locale: Locale(languageCode)));
  }
}
