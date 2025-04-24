// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nagwa_books/resources/color_manager.dart';
import 'package:nagwa_books/utils/app_utils/extensions_methods.dart';
import 'package:nagwa_books/widgets/custom_button.dart';
import 'package:nagwa_books/widgets/custom_text.dart';

class GlobalUiUtils {
//**************** */ show Snack Bar *********************/
  static void showSnackBar(BuildContext context, {required String messageContent, Color color = ColorManager.whiteColor, String? icon, bool isError = true}) {
    final animationController = AnimationController(
      vsync: Scaffold.of(context),
      duration: const Duration(milliseconds: 500),
      reverseDuration: const Duration(milliseconds: 500),
    );

    final curvedAnimation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    );

    final slideAnimation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: Offset.zero,
    ).animate(curvedAnimation);

    animationController.forward();
    ScaffoldMessenger.of(context)
        .showSnackBar(
          SnackBar(
            shape: RoundedRectangleBorder(borderRadius: 12.allBorderRadius),
            content: SlideTransition(
              position: slideAnimation,
              child: IntrinsicHeight(
                child: Row(
                  children: [
                    Container(
                      width: 5.w,
                      height: double.infinity,
                      color: isError ? ColorManager.otherLightRed : ColorManager.lightBlueColor,
                    ),
                    Expanded(
                      child: Center(
                        child: CustomText(
                          title: messageContent,
                          color: ColorManager.whiteColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ).verticalPadding(12),
                    ),
                  ],
                ),
              ),
            ),
            backgroundColor: ColorManager.blueColor,
            duration: const Duration(seconds: 3),
            padding: EdgeInsets.zero,
            behavior: SnackBarBehavior.floating,
            clipBehavior: Clip.antiAlias,
            margin: 24.hPadding,
          ),
        )
        .closed
        .then((_) => animationController.dispose());
  }

  //**************** */ show success  Dialog with gif image *********************/
  static Future<void> showCustomDialog(
    BuildContext context, {
    required String msg,
    required String gifPath,
    void Function()? onTapFirstButton,
    void Function()? onTapSecondaryButton,
    String? firstButtonLabel,
    String? secondaryButtonLabel,
    bool iseFirstButtonLoading = false,
    bool isDismissible = true,
  }) async {
    showDialog(
      barrierDismissible: isDismissible,
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: ColorManager.whiteColor,
          insetPadding: 20.hPadding,
          shape: RoundedRectangleBorder(borderRadius: 8.allBorderRadius),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //* ************ */ Gif Image *********************/
              Image.asset(gifPath, height: 150.w, width: 150.w),

              //* ************ */ Content *********************/
              CustomText(
                title: msg,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.center,
              ).horizontalPadding(20),
              20.verticalSpace,

              //* ************ */ Buttons *********************/

              //* first action

              CustomButton(
                text: firstButtonLabel ?? '',
                onTap: onTapFirstButton ?? () => Navigator.pop(context),
                btnTextFontWeight: FontWeight.w700,
                buttonBorderRadius: 6.w,
                verticalPadding: 8.h,
                isLoading: iseFirstButtonLoading,
              ),
              //* second action
              CustomButton(
                text: secondaryButtonLabel ?? 'back'.tr(context),
                onTap: onTapSecondaryButton ?? () => Navigator.pop(context),
                buttonBackgroundColor: ColorManager.veryLightGrayColor,
                btnTextFontWeight: FontWeight.w700,
                buttonTextColor: ColorManager.darkGrayColor,
                buttonBorderRadius: 6.w,
                verticalPadding: 8.h,
              ),
            ],
          ).onlyPadding(bottomPadding: 20, startPadding: 20, endPadding: 20),
        );
      },
    );
  }
}
