import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nagwa_books/resources/app_strings_manager.dart';
import 'package:nagwa_books/resources/color_manager.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    this.title,
    this.color = ColorManager.blackColor,
    this.fontSize = 16,
    this.fontFamily = AppStringsManager.fontFamily,
    this.letterSpacing,
    this.fontWeight = FontWeight.w500,
    this.textHeight,
    this.maxLines,
    this.underLine = false,
    this.textAlign,
    this.textOverflow,
    this.textDirection,
    this.textStyle,
  });
  final String? title;
  final Color? color;
  final double fontSize;
  final TextStyle? textStyle;
  final FontWeight? fontWeight;
  final int? maxLines;
  final double? letterSpacing;
  final double? textHeight;
  final bool? underLine;
  final String? fontFamily;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final TextDirection? textDirection;

  @override
  Widget build(BuildContext context) {
    return Text(
      title ?? '',
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines,
      overflow: textOverflow,
      textDirection: textDirection,
      //textScaleFactor: 0.7,
      style: textStyle ??
          TextStyle(
            decoration: underLine! ? TextDecoration.underline : TextDecoration.none,
            fontSize: (fontSize.sp),
            fontWeight: fontWeight,
            fontFamily: fontFamily,
            height: textHeight ?? 0,
            color: color,
          ),
    );
  }
}
