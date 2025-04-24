import 'package:flutter/material.dart';
import 'package:nagwa_books/utils/app_utils/extensions_methods.dart';

class AppValidator {
  static String? emailValidate(String? text, BuildContext context) {
    String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (text == null || text.isEmpty) {
      return 'Email Required';
    } else if (!regex.hasMatch(text)) {
      return 'Not a valid email';
    }
    return null;
  }

  static String? phoneValidate(String? text, BuildContext context) {
    // Regular expression for Saudi Arabian phone number
    RegExp regExp = RegExp(r'^05\d{8}$');

    if (text == null || text.isEmpty) {
      return 'emptyPhone'.tr(context);
    } else if (!regExp.hasMatch(text)) {
      return 'notValidPhone'.tr(context);
    }
    return null;
  }

  static String? passwordValidate(String? text, BuildContext context) {
    // String pattern = r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}$';
    // RegExp regExp = RegExp(pattern);
    if (text == null || text.isEmpty) {
      return 'emptyPassword'.tr(context);
    } else if (text.length < 8) {
      return 'notValidPassword'.tr(context);
    }
    return null;
  }

  static String? userNameValidate(String? text, BuildContext context) {
    if (text == null || text.isEmpty) {
      return 'User name Required';
    } else if (text.length < 2) {
      return 'User name should be at least 2 characters';
    }
    return null;
  }

  static String? confirmPasswordValidate(
    String? text,
    String? password,
    BuildContext context,
  ) {
    if (text == null || text.isEmpty) {
      return 'emptyConfirmPassword'.tr(context);
    } else if (text != password) {
      return 'notValidConfirmPassword'.tr(context);
    }
    return null;
  }

  static String? required(String? text, BuildContext context) {
    if (text?.isEmpty == true) {
      return 'field_is_required'.tr(context);
    }
    return null;
  }

  //Visa Card id validation should be 14 digits
  static String? visaCardIdValidate(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return 'emptyVisaCardId'.tr(context);
    }
    value = value.replaceAll(' ', '');
    if (value.length != 16) {
      return 'cardIdValidation'.tr(context);
    }
    if (!RegExp(r'[0-9]{16}$').hasMatch(value)) {
      return 'notValidVisaCardId'.tr(context);
    }

    return null;
  }

  //Cvv validation should be 3 digits
  static String? cvvValidate(String? text, BuildContext context) {
    String pattern = r'^[0-9]{3}$';
    RegExp regExp = RegExp(pattern);
    if (text == null || text.isEmpty) {
      return 'emptyCvv'.tr(context);
    } else if (!regExp.hasMatch(text)) {
      return 'notValidCvv'.tr(context);
    }
    return null;
  }
}
