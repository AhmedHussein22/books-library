import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nagwa_books/resources/color_manager.dart';
import 'package:nagwa_books/widgets/custom_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.backgroundColor,
    this.elevation,
    this.title,
    this.leadingWidth = 30,
    this.leadingHeight = 30,
    this.titleSize,
    this.titleWidget,
    this.leadingIcon,
    this.centerTitle = true,
    this.actionIcons,
    this.onLeadingTap,
  });
  final Color? backgroundColor;
  final double? elevation;
  final String? title;
  final Widget? titleWidget;
  final double? titleSize;
  final VoidCallback? onLeadingTap;
  final Widget? leadingIcon;
  final List<Widget>? actionIcons;
  final double leadingWidth;
  final double leadingHeight;
  final bool? centerTitle;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: backgroundColor ?? ColorManager.whiteColor,
      child: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: backgroundColor ?? ColorManager.whiteColor,
        forceMaterialTransparency: true,
        elevation: elevation ?? 0.0,
        actions: actionIcons ?? [],
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            //********* back icon *********//
            leadingIcon ??
                GestureDetector(
                  onTap: Navigator.canPop(context)
                      ? () => Navigator.pop(context)
                      : () {
                          if (onLeadingTap != null) {
                            onLeadingTap!();
                          }
                        },
                  child: Container(
                    width: 30.w,
                    height: 30.w,
                    alignment: Alignment.center,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        side: BorderSide(color: ColorManager.veryDarkGrayColor, width: 1.5.w),
                      ),
                    ),
                    child: Icon(
                      Icons.arrow_back,
                      color: ColorManager.blackColor,
                      size: 20.r,
                    ),
                  ),
                ),
            const Spacer(),
            //title
            titleWidget ??
                CustomText(
                  title: title ?? '',
                  fontSize: titleSize ?? (1.sw < 600 ? 18 : 20),
                  fontWeight: FontWeight.w700,
                  color: ColorManager.blackColor,
                  maxLines: 1,
                ),
            const Spacer(),
          ],
        ),
        centerTitle: centerTitle,
        leadingWidth: 0.r,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight.h);
}
