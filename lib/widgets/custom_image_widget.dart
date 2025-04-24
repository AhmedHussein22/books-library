import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nagwa_books/resources/assets_manager.dart';
import 'package:nagwa_books/widgets/custom_loading_widget.dart';

class CustomImageWidget extends StatelessWidget {
  const CustomImageWidget({
    this.imageUrl,
    super.key,
    this.width,
    this.height,
    this.borderRadius,
    this.isImageAsset = false,
    this.boxFit = BoxFit.cover,
    this.color,
    this.blendMode,
    this.assetPath,
    this.customBorderRadius,
  });
  final String? imageUrl;
  final String? assetPath;
  final BoxFit boxFit;
  final double? width;
  final double? height;
  final double? borderRadius;
  final bool isImageAsset;
  final Color? color;
  final BlendMode? blendMode;
  final BorderRadius? customBorderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: customBorderRadius ?? BorderRadius.circular(borderRadius ?? 10.r),
      child: isImageAsset || imageUrl == null
          ? Image.asset(
              assetPath ?? ImageAssets.defaultImagePlaceholder,
              width: width ?? 1.sw * .35,
              height: height ?? 1.sh * .15,
              color: color,
              colorBlendMode: blendMode,
              fit: boxFit,
            )
          : CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: imageUrl!,
              alignment: Alignment.topCenter,
              width: width ?? 1.sw * .35,
              height: height ?? 1.sh * .15,
              color: color,
              colorBlendMode: blendMode,
              placeholder: (context, url) => CustomShimmerLoadingWidget(
                width: width ?? 1.sw * .35,
                height: height ?? 1.sh * .15,
              ),
              errorWidget: (context, url, error) => Image.asset(
                ImageAssets.defaultImagePlaceholder,
                width: width ?? 1.sw * .35,
                height: height ?? 1.sh * .15,
                color: color,
                colorBlendMode: blendMode,
                fit: boxFit,
              ),
            ),
    );
  }
}
