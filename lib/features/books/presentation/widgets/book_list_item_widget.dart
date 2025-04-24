import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nagwa_books/features/books/data/models/book_model.dart';
import 'package:nagwa_books/resources/color_manager.dart';
import 'package:nagwa_books/utils/app_utils/extensions_methods.dart';
import 'package:nagwa_books/widgets/custom_image_widget.dart';
import 'package:nagwa_books/widgets/custom_text.dart';

class BookListItemWidget extends StatelessWidget {
  final Result book;

  const BookListItemWidget({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: 8.vPadding,
      decoration: BoxDecoration(
        color: ColorManager.whiteColor,
        borderRadius: 8.allBorderRadius,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: 16.vPadding + 8.hPadding,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //** book image widget **
            //** use custom image widget to load the book image from the url **
            CustomImageWidget(
              imageUrl: book.formats?.imageJpeg,
              width: 80,
              height: 140,
              customBorderRadius: 4.allBorderRadius,
            ),
            16.horizontalSizedBox,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //** book title widget **
                  CustomText(
                    title: book.title ?? 'Unknown Title',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    maxLines: 2,
                    textOverflow: TextOverflow.ellipsis,
                  ),
                  8.verticalSizedBox,
                  //** book author widget **
                  CustomText(
                    title: 'By: ${book.authors?.map((author) => author.name).join(', ') ?? 'Unknown Author'}',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: ColorManager.lightGrayColor,
                  ),
                  8.verticalSizedBox,

                  //** book summary widget **
                  ExpandableText(
                    text: book.subjects?.join(', ') ?? 'No Summary',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExpandableText extends StatefulWidget {
  final String text;

  const ExpandableText({super.key, required this.text});

  @override
  ExpandableTextState createState() => ExpandableTextState();
}

class ExpandableTextState extends State<ExpandableText> with SingleTickerProviderStateMixin {
  bool isExpanded = false; // To toggle between expanded and collapsed

  @override
  Widget build(BuildContext context) {
    final TextStyle normalTextStyle = TextStyle(color: ColorManager.grayColor, fontSize: 12.sp);
    final TextStyle clickableTextStyle = TextStyle(color: ColorManager.blueColor, fontSize: 12.sp, fontWeight: FontWeight.bold);

    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded; // Toggle between "See More" and "See Less"
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //*  add some  animation to the ExpandableText by using AnimatedSize
          AnimatedSize(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: isExpanded
                ? CustomText(
                    title: widget.text,
                    textStyle: normalTextStyle,
                  )
                : CustomText(
                    title: widget.text,
                    maxLines: 3,
                    textOverflow: TextOverflow.ellipsis,
                    textStyle: normalTextStyle,
                  ),
          ),
          CustomText(
            title: isExpanded ? 'show Less' : 'show More', // Text toggles between 'Show More' and 'Show Less'
            textStyle: clickableTextStyle,
          ),
        ],
      ),
    );
  }
}
