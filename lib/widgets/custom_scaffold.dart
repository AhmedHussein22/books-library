import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_app_bar.dart';

class CustomScaffoldWidget extends StatelessWidget {
  const CustomScaffoldWidget({
    required this.body,
    super.key,
    this.title = '',
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.showAppBar = true,
    this.backgroundColor,
    this.floatingActionButtonLocation,
    this.appBar,
    this.verticalPadding,
    this.horizontalPadding,
    this.resizeToAvoidBottomInset = false,
    this.mustAuth = false,
  });
  final Widget body;
  final String title;
  final double? verticalPadding, horizontalPadding;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final bool showAppBar, resizeToAvoidBottomInset, mustAuth;
  final Color? backgroundColor;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final PreferredSizeWidget? appBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      appBar: showAppBar ? appBar ?? CustomAppBar(title: title) : null,
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: verticalPadding ?? 12.h,
          horizontal: horizontalPadding ?? 24.w,
        ),
        child: body,
      ),
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
      backgroundColor: backgroundColor,
      floatingActionButtonLocation: floatingActionButtonLocation,
    );
  }
}
