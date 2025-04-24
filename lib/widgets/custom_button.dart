import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:nagwa_books/resources/color_manager.dart';
import 'package:nagwa_books/utils/app_utils/extensions_methods.dart';
import 'package:nagwa_books/widgets/custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.text,
    super.key,
    this.onTap,
    this.buttonBackgroundColor = ColorManager.blueColor,
    this.disabledColor = ColorManager.grayColor,
    this.hasGradient = true,
    this.isLoading = false,
    this.hasTextAndImage = false,
    this.isEnabled = true,
    this.buttonHeight,
    this.buttonTextSize = 18,
    this.buttonTextColor = ColorManager.whiteColor,
    this.iconWidget,
    this.buttonGradient,
    this.btnTextFontWeight = FontWeight.w700,
    this.buttonBorderColor = Colors.transparent,
    this.borderThickness = 0,
    this.buttonWidth,
    this.buttonGap,
    this.verticalMargin,
    this.horizontalMargin,
    this.buttonBorderRadius = 10,
    this.progressColor = ColorManager.whiteColor,
    this.verticalPadding,
    this.horizontalPadding,
    this.isIconStart = false,
    this.buttonChild,
  });
  final VoidCallback? onTap;
  final String text;
  final bool isEnabled, hasGradient;
  final bool hasTextAndImage;
  final bool isLoading;
  final Widget? iconWidget;
  final bool isIconStart;
  final Color? buttonBackgroundColor, buttonBorderColor, disabledColor, buttonTextColor, progressColor;
  final double? buttonTextSize;
  final Gradient? buttonGradient;
  final Widget? buttonChild;
  final FontWeight? btnTextFontWeight;
  final double? buttonWidth, borderThickness, buttonBorderRadius, buttonHeight, buttonGap, verticalMargin, horizontalMargin, verticalPadding, horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isLoading || !isEnabled ? null : onTap,
      child: Container(
        // constraints: BoxConstraints(
        //   minHeight: btnHeight ?? (1.sw > 600 ? 60.h : 50.h),
        //   maxHeight: btnHeight ?? (1.sw > 600 ? 65.h : 55.h),
        // ),
        height: buttonHeight,
        width: buttonWidth ?? double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding ?? 24.w,
          vertical: verticalPadding ?? 12.h,
        ),
        margin: EdgeInsets.symmetric(vertical: verticalMargin ?? 8.h, horizontal: horizontalMargin ?? 0),
        decoration: BoxDecoration(
          color: (isEnabled ? buttonBackgroundColor : disabledColor),
          borderRadius: buttonBorderRadius!.allBorderRadius,
          border: Border.all(
            width: borderThickness!,
            color: buttonBorderColor!,
          ),
        ),
        child: Center(
          child: isLoading
              ? SpinKitFadingCircle(
                  color: progressColor,
                  size: 26.r,
                )
              : buttonChild ??
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (iconWidget != null && isIconStart) ...[
                        iconWidget!,
                        8.horizontalSpace,
                      ],
                      Center(
                        child: CustomText(
                          title: text,
                          color: buttonTextColor,
                          fontSize: buttonTextSize ?? 16,
                          fontWeight: btnTextFontWeight,
                        ),
                      ),
                      if (iconWidget != null && !isIconStart) ...[
                        8.horizontalSpace,
                        iconWidget!,
                      ],
                    ],
                  ),
        ),
      ),
    );
  }
}
