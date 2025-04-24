// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:nagwa_books/resources/assets_manager.dart';
// import 'package:nagwa_books/resources/color_manager.dart';
// import 'package:nagwa_books/widgets/custom_loading_widget.dart';

// class CustomAvatarWidget extends StatelessWidget {
//   const CustomAvatarWidget({
//     required this.avatarRadius,
//     super.key,
//     this.imageUrl,
//     this.isImageAsset = false,
//     this.displayDefaultImage = true,
//     this.blendMode,
//     this.backgroundColor,
//     this.child,
//     this.avatarImagePath,
//   });
//   final String? imageUrl;
//   final double avatarRadius;
//   final bool isImageAsset;
//   final bool displayDefaultImage;
//   final Color? backgroundColor;
//   final Widget? child;
//   final BlendMode? blendMode;
//   final String? avatarImagePath;

//   @override
//   Widget build(BuildContext context) {
//     return isImageAsset
//         ? CircleAvatar(
//             radius: avatarRadius,
//             backgroundColor: backgroundColor ?? ColorManager.veryLightGrayColor,
//             backgroundImage: displayDefaultImage
//                 ? AssetImage(
//                     avatarImagePath ?? ImageAssets.avatarImagePlaceholder,
//                   )
//                 : null,
//             child: child,
//           )
//         : CachedNetworkImage(
//             imageUrl: '$imageUrl',
//             fit: BoxFit.cover,
//             alignment: Alignment.center,
//             imageBuilder: (context, imageProvider) => CircleAvatar(
//               radius: avatarRadius,
//               backgroundColor: backgroundColor ?? ColorManager.veryLightGrayColor,
//               backgroundImage: imageProvider,
//               child: child,
//             ),
//             colorBlendMode: blendMode,
//             placeholder: (context, url) => CircleAvatar(
//               maxRadius: avatarRadius,
//               minRadius: avatarRadius,
//               child: CustomShimmerLoadingWidget(
//                 width: avatarRadius,
//                 height: avatarRadius,
//                 widgetBorderRadius: avatarRadius / 2,
//               ),
//             ),
//             errorWidget: (context, url, error) => CircleAvatar(
//               radius: avatarRadius,
//               backgroundColor: backgroundColor ?? ColorManager.veryLightGrayColor,
//               backgroundImage: AssetImage(
//                 avatarImagePath ?? ImageAssets.avatarImagePlaceholder,
//               ),
//               child: child,
//             ),
//           );
//   }
// }
