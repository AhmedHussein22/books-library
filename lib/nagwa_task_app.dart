import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nagwa_books/config/locale/locale_setup.dart';
import 'package:nagwa_books/config/theme/app_theme.dart';
import 'package:nagwa_books/features/splash_feature/cubit/splash_cubit.dart';
import 'package:nagwa_books/features/splash_feature/pages/splash_page.dart';
import 'package:nagwa_books/resources/app_keys_manager.dart';
import 'package:nagwa_books/resources/app_strings_manager.dart';
import 'package:nagwa_books/shared/shared_cubits/locale_cubit/locale_cubit.dart';
import 'package:nagwa_books/utils/app_utils/app_logs.dart';

class NagwaTaskApp extends StatefulWidget {
  const NagwaTaskApp({super.key});

  @override
  NagwaTaskAppState createState() => NagwaTaskAppState();
}

class NagwaTaskAppState extends State<NagwaTaskApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LocaleCubit()..getSavedLanguage()),
        BlocProvider(create: (context) => SplashCubit()),
      ],
      child: BlocBuilder<LocaleCubit, ChangeLocaleState>(
        builder: (context, state) {
          AppLogs.infoLog(state.locale.languageCode, 'currentLangCode');
          return ScreenUtilInit(
            designSize: const Size(375, 812),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (_, child) {
              AppLogs.infoLog(
                  'ScreenUtil ============>screenWidth ${ScreenUtil().screenWidth},screenHeight ${ScreenUtil().screenHeight} ,pixelRatio ${ScreenUtil().pixelRatio} ,statusBarHeight ${ScreenUtil().statusBarHeight} ,bottomBarHeight ${ScreenUtil().bottomBarHeight} ,textScaleFactor ${ScreenUtil().textScaleFactor} ');
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                navigatorKey: AppKeysManager.navigatorKey,
                title: AppStringsManager.appName,
                home: const SplashPage(),
                theme: AppTheme().appLightTheme(),
                locale: const Locale('en'),
                supportedLocales: const [
                  Locale('en'),
                  Locale('ar'),
                ],
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                localeResolutionCallback: (deviceLocale, supportedLocales) {
                  for (var locale in supportedLocales) {
                    if (deviceLocale != null && deviceLocale.languageCode == locale.languageCode) {
                      return deviceLocale;
                    }
                  }
                  return supportedLocales.first;
                },
              );
            },
          );
        },
      ),
    );
  }
}
