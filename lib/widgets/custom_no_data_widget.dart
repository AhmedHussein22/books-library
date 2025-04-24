import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nagwa_books/utils/app_utils/extensions_methods.dart';
import 'package:nagwa_books/widgets/custom_text.dart';

class CustomNoDataWidget extends StatelessWidget {
  const CustomNoDataWidget({super.key, this.message, this.height, this.width, this.title});
  final String? message, title;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.center,
          child: Icon(
            Icons.error_outline,
            size: 100.r,
            color: Colors.grey,
          ),
        ),
        // 20.verticalSpace,
        //* **************No data title***************** */
        CustomText(
          title: title ?? 'noData'.tr(context),
          fontSize: 18,
          fontWeight: FontWeight.w500,
          textAlign: TextAlign.center,
        ),
        10.verticalSpace,
        CustomText(
          title: message ?? 'noData'.tr(context),
          fontSize: 16,
          textAlign: TextAlign.center,
        ),
      ],
    ).horizontalPadding(24);
  }
}
