import 'package:flutter/material.dart';
import 'package:nagwa_books/resources/enums_manager.dart';
import 'package:nagwa_books/widgets/custom_error_widget.dart';
import 'package:nagwa_books/widgets/custom_loading_widget.dart';

class ApiStatusWidget extends StatelessWidget {
  const ApiStatusWidget({required this.apiStatus, required this.succussWidget, super.key, this.loadingWidget, this.errorWidget});
  final ApiStatus apiStatus;
  final Widget? loadingWidget;
  final Widget? errorWidget;
  final Widget succussWidget;

  @override
  Widget build(BuildContext context) {
    switch (apiStatus) {
      case ApiStatus.loading:
      case ApiStatus.idle:
        return loadingWidget ?? const CustomSpinKitLoadingWidget();
      case ApiStatus.error:
        return errorWidget ?? const CustomErrorWidget();
      case ApiStatus.success:
        return succussWidget;
      default:
        return Container();
    }
  }
}
