// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nagwa_books/features/splash_feature/cubit/splash_cubit.dart';
import 'package:nagwa_books/resources/app_strings_manager.dart';
import 'package:nagwa_books/resources/assets_manager.dart';
import 'package:nagwa_books/resources/color_manager.dart';
import 'package:nagwa_books/widgets/custom_loading_widget.dart';
import 'package:nagwa_books/widgets/custom_text.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 300), () => BlocProvider.of<SplashCubit>(context, listen: false).navigateToNextScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.blueColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              ImageAssets.logoPNG,
              width: 200.w,
              height: 200.w,
            ),
            20.verticalSpace,
            const CustomText(
              title: AppStringsManager.appName,
              color: ColorManager.whiteColor,
              fontSize: 40,
              fontWeight: FontWeight.w700,
            ),
            30.verticalSpace,
            const CustomSpinKitLoadingWidget(
              progressColor: ColorManager.whiteColor,
            )
          ],
        ),
      ),
    );
  }
}
