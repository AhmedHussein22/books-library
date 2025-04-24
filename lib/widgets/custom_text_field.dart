// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nagwa_books/resources/color_manager.dart';
import 'package:nagwa_books/utils/app_utils/extensions_methods.dart';
import 'package:nagwa_books/widgets/custom_text.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.errorText,
    this.hintColor,
    this.hintTextSize,
    this.enabledBorderColor = Colors.transparent,
    this.focusedBorderColor,
    this.fillColor = ColorManager.whiteColor,
    this.type,
    this.hintText,
    this.onSaved,
    this.enabled = true,
    this.validator,
    this.onChange,
    this.onTap,
    this.availableArabic = true,
    this.controller,
    this.isNumber = false,
    this.isRequired = true,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.linesNumber = 1,
    this.textAlign,
    this.cursorColor,
    this.contentPadding,
    this.textInputAction,
    this.isAutofocus,
    this.inputFormatter,
    this.textColor,
    this.title,
    this.titleColor,
    this.initialValue,
    this.focusNode,
    this.readOnly = false,
    this.onSubmitted,
    this.suffixText,
    this.onTapOutside,
    this.togglePasswordVisibility,
    this.suffixWidget,
    this.onEditingComplete,
    this.prefixWidget,
    this.padding,
    this.isWithoutLeftBorder = false,
    this.counterText,
    this.disableBorderColor,
  });
  final String? hintText;
  final Color? hintColor;
  final double? hintTextSize;
  final Color enabledBorderColor;
  final Color? focusedBorderColor;
  final Color? disableBorderColor;
  final Color? fillColor;
  final String? errorText;
  final String? initialValue;
  final String? title;
  final Color? titleColor;
  final String? suffixText;
  final Function(String?)? onSaved;
  final Function(String)? onChange;
  final Function(String)? onSubmitted;
  final String? Function(String?)? validator;
  final Function()? onTap;
  final bool? enabled;
  final bool? availableArabic;
  final TextInputType? type;
  final TextEditingController? controller;
  final Color? cursorColor;
  final Color? textColor;
  final bool isNumber;
  final bool obscureText;
  final int? linesNumber;
  final EdgeInsetsGeometry? contentPadding;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final Widget? prefixWidget;
  final TextAlign? textAlign;
  final TextInputAction? textInputAction;
  final bool? isAutofocus;
  final List<TextInputFormatter>? inputFormatter;
  final FocusNode? focusNode;
  final Function(PointerDownEvent)? onTapOutside;
  final bool isRequired;
  final bool readOnly;
  final Function()? togglePasswordVisibility;
  final Widget? suffixWidget;
  final VoidCallback? onEditingComplete;
  final EdgeInsetsGeometry? padding;
  final bool? isWithoutLeftBorder;
  final String? counterText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //******* title  ******* */
        if (title != null)
          Padding(
            padding: EdgeInsets.only(bottom: 8.h),
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: CustomText(
                title: title,
                color: titleColor,
              ),
            ),
          ),
        //******* text field  ******* */
        TextFormField(
          focusNode: focusNode,
          autofocus: isAutofocus ?? false,
          textInputAction: textInputAction ?? TextInputAction.next,
          obscureText: obscureText,
          onTapOutside: onTapOutside ?? (event) => FocusScope.of(context).unfocus(),
          maxLines: linesNumber,
          enabled: enabled,
          textAlignVertical: TextAlignVertical.center,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          readOnly: readOnly,
          initialValue: initialValue,
          onEditingComplete: onEditingComplete,
          onSaved: onSaved,
          validator: validator ??
              (value) {
                if (isRequired) {
                  return value == '' || value == null ? "${title ?? hintText} ${'required'.tr(context)}" : null;
                }
                return null;
              },
          cursorColor: cursorColor ?? ColorManager.blackColor,
          keyboardType: type ?? TextInputType.text,
          onTap: onTap,
          onChanged: onChange,
          onFieldSubmitted: onSubmitted,
          controller: controller,
          style: TextStyle(
            color: textColor ?? ColorManager.blackColor,
            fontSize: hintTextSize ?? 15.sp,
            fontWeight: FontWeight.w500,
          ),
          autocorrect: true,
          inputFormatters: inputFormatter ??
              (isNumber
                  ? <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                    ]
                  : []),
          decoration: InputDecoration(
            counterText: counterText ?? ' ',
            errorStyle: TextStyle(
              color: ColorManager.otherRed2,
              fontSize: 12.sp,
            ),
            prefixIcon: prefixWidget ??
                (prefixIcon != null
                    ? Padding(
                        padding: EdgeInsetsDirectional.only(start: 12.w, end: 8.w),
                        child: Icon(
                          prefixIcon,
                          size: 24.r,
                          color: ColorManager.blueColor,
                        ),
                      )
                    : null),
            // prefixIconColor: ColorManager.primary500,
            suffix: suffixWidget,
            suffixIconConstraints: const BoxConstraints(
              minWidth: 0,
              minHeight: 0,
            ),
            suffixIcon: suffixIcon ??
                (type == TextInputType.visiblePassword
                    ? GestureDetector(
                        onTap: togglePasswordVisibility,
                        child: Padding(
                          padding: EdgeInsetsDirectional.only(start: 8.w, end: 12.w),
                          child: Icon(
                            obscureText ? Icons.visibility_off : Icons.visibility,
                            color: obscureText ? ColorManager.veryDarkGrayColor.withOpacity(0.7) : ColorManager.lightGrayColor,
                            size: 26.r,
                          ),
                        ),
                      )
                    : null),
            suffixText: suffixText,
            filled: true,
            alignLabelWithHint: true,
            errorMaxLines: 3,

            isDense: true,
            hintStyle: TextStyle(color: hintColor ?? ColorManager.darkGrayColor, fontSize: hintTextSize ?? 15.sp, fontWeight: FontWeight.w500),
            contentPadding: contentPadding ?? EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            hintText: hintText,
            fillColor: fillColor,
            border: OutlineInputBorder(borderRadius: 10.allBorderRadius, borderSide: BorderSide(color: enabledBorderColor, width: 1.w)),
            enabledBorder: OutlineInputBorder(borderRadius: 10.allBorderRadius, borderSide: BorderSide(color: enabledBorderColor, width: 1.w)),
            disabledBorder: OutlineInputBorder(borderRadius: 10.allBorderRadius, borderSide: BorderSide(color: enabledBorderColor, width: 1.w)),
            errorBorder: OutlineInputBorder(
              borderRadius: 10.allBorderRadius,
              borderSide: BorderSide(color: ColorManager.otherRed2, width: 1.w),
            ),
            focusedBorder: OutlineInputBorder(borderRadius: 10.allBorderRadius, borderSide: BorderSide(color: enabledBorderColor, width: 1.w)),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: 10.allBorderRadius,
              borderSide: BorderSide(color: ColorManager.otherRed2, width: 1.w),
            ),
          ),
        ),
      ],
    );
  }
}
