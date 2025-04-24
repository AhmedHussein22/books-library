import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nagwa_books/config/locale/locale_setup.dart';

//! String Extension`
extension StringExtension on String {
  // ***************** localization ****************** */
  String tr(BuildContext context) {
    return AppLocalizations.of(context)?.translate(this) ?? this;
  }

//*****************  check is string is English  ****************** */
  bool startsWithEnglishLetter() {
    if (isEmpty) {
      return false;
    }
    int firstCodeUnit = codeUnitAt(0);

    // Check if the first character is an English uppercase or lowercase letter
    return (firstCodeUnit >= 65 && firstCodeUnit <= 90) || (firstCodeUnit >= 97 && firstCodeUnit <= 122);
  }

  //******* */ Check if the string is a valid URL ********
  bool isValidURL() {
    final RegExp urlRegex = RegExp(
      r'^(https?:\/\/)?([a-zA-Z0-9.-]+)(:[0-9]+)?(\/.*)?$',
    );
    return urlRegex.hasMatch(this);
  }

  //*** */ Capitalize the first letter of the string ********
  String capitalize() {
    if (isEmpty) {
      return '';
    }
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}

//! Context Extension
extension ContextExtension on BuildContext {
  //**************** Navigation ****************** */
  Future<T?> pushNamed<T>(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<T?> push<T>(Widget page) {
    return Navigator.push(this, MaterialPageRoute(builder: (context) => page));
  }

  Future<T?> pushReplacementNamed<T>(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<T?> pushNamedAndRemoveUntil<T>(String routeName, {required RoutePredicate predicate, Object? arguments}) {
    return Navigator.of(this).pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  }

  void pop<T>([T? result]) => Navigator.pop(this, result);

  // ***Access the scaffold messenger for showing snack bars **
  ScaffoldMessengerState get scaffoldMessenger => ScaffoldMessenger.of(this);
}

//! numbers Extension

extension AppNumberExtension on num {
  //************ Padding *********************/
  EdgeInsets get allPadding => EdgeInsets.all(toDouble().r);
  EdgeInsets get vPadding => EdgeInsets.symmetric(vertical: toDouble().h);
  EdgeInsets get hPadding => EdgeInsets.symmetric(horizontal: toDouble().w);

  //****************  borderRadius ****************** */
  BorderRadius get allBorderRadius => BorderRadius.circular(toDouble().w);
  BorderRadius get topBorderRadius => BorderRadius.vertical(top: Radius.circular(toDouble().w));
  BorderRadius get bottomBorderRadius => BorderRadius.vertical(bottom: Radius.circular(toDouble().w));

  //***************  dividers ****************** */
  Widget get verticalDivider => VerticalDivider(width: toDouble().w, thickness: 1);
  Widget get horizontalDivider => Divider(height: toDouble().h, thickness: 1);

  //****************  SizedBox ****************** */
  Widget get verticalSizedBox => SizedBox(height: toDouble().h);
  Widget get horizontalSizedBox => SizedBox(width: toDouble().w);
}

//! WidgetExtension
extension WidgetExtension on Widget {
  //************ Padding *********************/
  Widget horizontalPadding(double padding) => Padding(padding: EdgeInsets.symmetric(horizontal: padding.w), child: this);
  Widget verticalPadding(double padding) => Padding(padding: EdgeInsets.symmetric(vertical: padding.h), child: this);
  Widget allPadding(double padding) => Padding(padding: EdgeInsets.all(padding.r), child: this);
  Widget onlyPadding({double topPadding = 0, double bottomPadding = 0, double endPadding = 0, double startPadding = 0}) => Padding(padding: EdgeInsetsDirectional.only(bottom: bottomPadding.h, start: startPadding.w, end: endPadding.w, top: topPadding.h), child: this);
  //****************  center ****************** */
  Widget center() => Center(child: this);

  //*** */ Wrap the widget with a ClipRRect ********
  Widget clipRRect({BorderRadius borderRadius = BorderRadius.zero}) => ClipRRect(
        borderRadius: borderRadius,
        child: this,
      );
}
