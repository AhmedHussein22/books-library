import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:nagwa_books/resources/color_manager.dart';
import 'package:nagwa_books/utils/app_utils/extensions_methods.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomShimmerLoadingWidget extends StatelessWidget {
  const CustomShimmerLoadingWidget({
    super.key,
    this.baseColor = ColorManager.veryLightGrayColor,
    this.width = double.infinity,
    this.widgetBorderRadius,
    this.height = 70,
    this.highlightColor = ColorManager.backgroundColor,
  });
  final Color baseColor, highlightColor;
  final double width, height;
  final double? widgetBorderRadius;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      effect: ShimmerEffect(
        baseColor: baseColor,
        highlightColor: highlightColor,
        duration: const Duration(milliseconds: 1500),
      ),
      child: SizedBox(
        width: width,
        height: height,
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widgetBorderRadius ?? 10),
          ),
          child: Container(
            color: baseColor,
            height: height,
            width: width,
          ),
        ),
      ),
    );
  }
}

//* ListView.builder loading
class CustomSkeletonizerLoading extends StatelessWidget {
  const CustomSkeletonizerLoading({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 8,
      padding: 16.vPadding,
      separatorBuilder: (BuildContext context, int index) => 10.verticalSizedBox,
      itemBuilder: (BuildContext context, int index) {
        return Skeletonizer(
          ignorePointers: true,
          enabled: true,
          containersColor: Colors.white,
          child: child,
        );
      },
    );
  }
}

// *Annotations
//https://pub.dev/packages/skeletonizer#annotations
class CustomSpinKitLoadingWidget extends StatelessWidget {
  const CustomSpinKitLoadingWidget({super.key, this.progressColor, this.size});
  final Color? progressColor;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitCubeGrid(
        color: progressColor ?? ColorManager.blueColor,
        size: size ?? 50.w,
      ),
    );
  }
}
