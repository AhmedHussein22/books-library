// import 'package:nagwa_books/resources/color_manager.dart';
// import 'package:nagwa_books/utils/app_utils/extensions_methods.dart';
// import 'package:nagwa_books/widgets/custom_text.dart';
// import 'package:dropdown_search/dropdown_search.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class CustomDropdown<T> extends StatelessWidget {
//   const CustomDropdown({
//     required this.items,
//     super.key,
//     this.hintText = '',
//     this.titleText = '',
//     this.onChanged,
//     this.selectedValue,
//     this.initialValue = '',
//     this.width,
//     this.onClearFun,
//     this.isActive = true,
//     this.isRequired = false,
//     this.showClearIcon = false,
//     this.isShadow = true,
//     this.contentPadding,
//     this.validatorFun,
//     this.hintColor,
//     this.hintFontSize,
//     this.enabledBorderColor,
//     this.focusedBorderColor,
//     this.fillColor,
//     this.errorText,
//     this.title,
//     this.titleColor,
//     this.borderRadius,
//     this.textAlign,
//     this.suffixWidget,
//     this.prefixIcon,
//     this.prefixWidget,
//     this.suffixIcon,
//     this.itemAsString,
//     this.compareFn,
//     required this.searchHint,
//   });

//   final DropdownSearchOnFind<T>? items;
//   final String Function(T)? itemAsString;
//   final ValueChanged<T?>? onChanged;
//   final bool Function(T, T)? compareFn;
//   final T? selectedValue;

//   final String hintText, searchHint;
//   final String titleText;
//   final String initialValue;
//   final double? width;
//   final bool isActive;
//   final bool isRequired;
//   final bool isShadow;
//   final bool showClearIcon;
//   final dynamic onClearFun;
//   final String? Function(String?)? validatorFun;
//   final EdgeInsetsGeometry? contentPadding;
//   final Color? hintColor;
//   final double? hintFontSize;
//   final Color? enabledBorderColor;
//   final Color? focusedBorderColor;
//   final Color? fillColor;
//   final String? errorText;
//   final String? title;
//   final Color? titleColor;
//   final IconData? prefixIcon;
//   final double? borderRadius;
//   final Widget? prefixWidget;
//   final Widget? suffixIcon;
//   final TextAlign? textAlign;
//   final Widget? suffixWidget;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Title above dropdown (if provided)
//         if (title != null)
//           Padding(
//             padding: EdgeInsets.only(bottom: 8.h),
//             child: Align(
//               alignment: AlignmentDirectional.centerStart,
//               child: CustomText(
//                 title: title,
//                 color: titleColor,
//               ),
//             ),
//           ),

//         // Dropdown Search Field
//         DropdownSearch<T>(
//           mode: Mode.form, // Mode can be set to dialog or menu
//           items: items,

//           enabled: isActive,
//           validator: (value) {
//             if (isRequired) {
//               return value == '' || value == null ? "${title ?? hintText} ${'required'.tr(context)}" : null;
//             }
//             return null;
//           },

//           suffixProps: DropdownSuffixProps(
//             dropdownButtonProps: DropdownButtonProps(
//               iconClosed: Icon(
//                 Icons.keyboard_arrow_down_rounded,
//                 color: ColorManager.lightGrayColor,
//                 size: 26.r,
//               ),
//               iconOpened: Icon(
//                 Icons.keyboard_arrow_up_rounded,
//                 color: ColorManager.lightGrayColor,
//                 size: 26.r,
//               ),
//             ),
//             clearButtonProps: ClearButtonProps(
//               isVisible: showClearIcon && selectedValue != null,
//               padding: EdgeInsetsDirectional.only(end: 20.w),
//               icon: Icon(
//                 Icons.clear,
//                 color: ColorManager.blueColor,
//                 size: 24.r,
//               ),
//             ),
//           ),

//           decoratorProps: DropDownDecoratorProps(
//             baseStyle: TextStyle(
//               color: ColorManager.grayColor,
//               fontSize: 14.sp,
//               fontWeight: FontWeight.w500,
//             ),
//             decoration: InputDecoration(
//               filled: true,
//               hintText: hintText,
//               counterText: ' ',
//               hintStyle: TextStyle(
//                 color: hintColor ?? ColorManager.grayColor,
//                 fontSize: hintFontSize ?? 14.sp,
//                 fontWeight: FontWeight.w500,
//               ),
//               fillColor: fillColor ?? (isActive ? ColorManager.whiteColor : ColorManager.veryLightGrayColor),
//               contentPadding: contentPadding ?? EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(borderRadius ?? 10.r),
//                 borderSide: BorderSide(
//                   color: enabledBorderColor ?? Colors.grey,
//                   width: 1.w,
//                 ),
//               ),
//               disabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(borderRadius ?? 10.r),
//                 borderSide: BorderSide(
//                   color: enabledBorderColor ?? Colors.grey,
//                   width: 1.w,
//                 ),
//               ),
//               enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(borderRadius ?? 10.r),
//                 borderSide: BorderSide(
//                   color: enabledBorderColor ?? Colors.grey,
//                   width: 1.w,
//                 ),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(borderRadius ?? 10.r),
//                 borderSide: BorderSide(
//                   color: enabledBorderColor ?? ColorManager.blueColor,
//                   width: 1.w,
//                 ),
//               ),
//               errorBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(borderRadius ?? 10.r),
//                 borderSide: BorderSide(
//                   color: ColorManager.otherRed2,
//                   width: 1.w,
//                 ),
//               ),
//               errorText: errorText,
//               errorStyle: TextStyle(
//                 color: ColorManager.otherRed2,
//                 fontSize: 12.sp,
//                 fontWeight: FontWeight.w500,
//               ),
//               prefixIcon: prefixWidget ??
//                   (prefixIcon != null
//                       ? Padding(
//                           padding: EdgeInsetsDirectional.only(start: 12.w, end: 8.w),
//                           child: Icon(
//                             prefixIcon,
//                             color: ColorManager.blueColor,
//                             size: 26.r,
//                           ),
//                         )
//                       : null),
//             ),
//           ),
//           selectedItem: selectedValue,
//           compareFn: compareFn, // Comparison function to match selected items
//           itemAsString: itemAsString, // Converts object to string for display
//           onChanged: onChanged,
//           dropdownBuilder: (context, selectedItem) => selectedItem != null ? Text(itemAsString!(selectedItem)) : Text(hintText),

//           popupProps: PopupProps.menu(
//             fit: FlexFit.tight,

//             showSearchBox: true, // Enable search in dropdown
//             searchFieldProps: TextFieldProps(
//               decoration: InputDecoration(
//                 hintText: searchHint,
//                 hintStyle: TextStyle(
//                   color: ColorManager.lightGrayColor,
//                   fontSize: hintFontSize ?? 14.sp,
//                   fontWeight: FontWeight.w500,
//                 ),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10.r),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
