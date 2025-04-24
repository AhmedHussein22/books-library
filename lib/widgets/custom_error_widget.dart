import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nagwa_books/resources/color_manager.dart';
import 'package:nagwa_books/utils/app_utils/extensions_methods.dart';
import 'package:nagwa_books/widgets/custom_button.dart';
import 'package:nagwa_books/widgets/custom_text.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    super.key,
    this.message,
    this.onRetry,
    this.buttonText,
    this.showButton = true,
    this.radius = 30,
    this.iconSize = 45,
  });
  final String? message;
  final String? buttonText;
  final VoidCallback? onRetry;
  final bool showButton;
  final double radius, iconSize;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: ColorManager.blueColor,
            radius: radius.r,
            child: Icon(
              Icons.cancel_rounded,
              color: ColorManager.whiteColor,
              size: iconSize.r,
            ),
          ).verticalPadding(8),
          CustomText(
            title: 'error'.tr(context),
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: ColorManager.otherRed2,
          ),
          3.verticalSpace,
          CustomText(
            title: message ?? '',
            fontSize: 16,
            fontWeight: FontWeight.w600,
            textAlign: TextAlign.center,
          ).horizontalPadding(15),
          if (showButton)
            CustomButton(
              onTap: onRetry,
              text: buttonText ?? 'Try Again',
              buttonWidth: 0.5.sw,
              buttonTextSize: 14,
              btnTextFontWeight: FontWeight.w600,
            ),
        ],
      ),
    );
  }
}
