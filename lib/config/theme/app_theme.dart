import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nagwa_books/resources/app_strings_manager.dart';
import 'package:nagwa_books/resources/color_manager.dart';

class AppTheme {
  ThemeData appLightTheme() {
    return ThemeData(
      useMaterial3: true,

      unselectedWidgetColor: ColorManager.veryDarkGrayColor.withOpacity(0.55),
      primaryColor: ColorManager.whiteColor,

      dividerColor: ColorManager.grayColor,

      colorScheme: ThemeData().colorScheme.copyWith(
            secondary: ColorManager.backgroundColor,
            primary: ColorManager.veryDarkGrayColor,
            surface: ColorManager.whiteColor,
          ),
      dialogTheme: const DialogTheme(
        backgroundColor: ColorManager.whiteColor,
        surfaceTintColor: Colors.transparent,
      ),

      hintColor: ColorManager.grayColor,
      secondaryHeaderColor: ColorManager.whiteColor,
      splashColor: Colors.transparent,
      scaffoldBackgroundColor: ColorManager.backgroundColor,
      fontFamily: AppStringsManager.fontFamily,

      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: ColorManager.veryDarkGrayColor,
        refreshBackgroundColor: ColorManager.blueColor,
      ),
      // app Bar Theme
      appBarTheme: AppBarTheme(
        centerTitle: true,
        color: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
        elevation: 0,
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.w500,
          color: ColorManager.blackColor,
          fontSize: 20.sp,
        ),
      ),
      // icon Theme
      iconTheme: IconThemeData(
        size: 26.r,
        color: ColorManager.veryDarkGrayColor,
      ),

      pageTransitionsTheme: const PageTransitionsTheme(builders: {
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      }),
      // divider Theme
      dividerTheme: const DividerThemeData(
        thickness: 1,
        indent: 0,
        endIndent: 0,
        color: ColorManager.veryLightGrayColor,
        space: 1,
      ),
      cardTheme: CardTheme(
        color: ColorManager.whiteColor,
        shadowColor: ColorManager.veryLightGrayColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        elevation: 6,
      ),

      // text Theme
      textTheme: TextTheme(
        //// ! semibold black 18 h3
        displaySmall: TextStyle(fontSize: 37.sp, fontWeight: FontWeight.w500),

        //// ! semibold kGreyColor 16 h4
        displayMedium: TextStyle(fontSize: 33.sp, fontWeight: FontWeight.w400),

        //// ! semibold kGreyColor 16 h5
        headlineSmall: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w500),

        //// ! semibold kGreyColor 16 h6
        titleLarge: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
        // ! semibold kGreyColor 16 s1
        titleMedium: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
        // ! semibold kGreyColor 16 s2

        titleSmall: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
        // ! semibold kGreyColor 16 b1
        bodyLarge: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
        // ! semibold kGreyColor 16 b2
        bodyMedium: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
        // ! semibold kGreyColor 16 caption
        bodySmall: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400),
        // ! semibold kGreyColor 16 button
        labelLarge: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
        // ! semibold kGreyColor 16 overline
        labelSmall: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w400),
      ),
    );
  }
}
