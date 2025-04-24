import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nagwa_books/resources/color_manager.dart';
import 'package:nagwa_books/services/data_base_service/local_storage/shared_prefs_storage.dart';
import 'package:nagwa_books/services/setup_dependency_injection.dart';

class ServicesInit {
  Future<void> init() async {
    //** ****** set status app bar color  ******** *
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: ColorManager.whiteColor,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
      systemNavigationBarColor: ColorManager.whiteColor,
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarDividerColor: ColorManager.lightGrayColor,
    ));

    ///** ****** setup  service locator for DI ******** */
    setupLocator();

    ///** ****** setup  service locator for DI ******** */
    await Future.wait([
      ///** ****** set Preferred Orientations to portrait only ******** */
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]),
      //* ****** set ScreenUtil setup to fix text size in reals mode ******** */
      ScreenUtil.ensureScreenSize(),

      ///** ****** hive storage ******** */
      SharedPrefsStorage.init(),
    ]);
  }
}
