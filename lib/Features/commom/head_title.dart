import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mahmoud_task/core/theme/styles.dart';

class HeadTitle extends StatelessWidget {
  final String iconPath;
  final String title1;
  final String title2;
  double width;
  double widthWithIcon;

  HeadTitle({
    Key? key,
    this.iconPath = '',
    required this.title1,
    required this.title2,
    this.width = 297,
    this.widthWithIcon = 225,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(16.h),child:Row(
      children: [
        iconPath == ''
            ? SizedBox()
            : SvgPicture.asset(iconPath,
            width: 68.w, height: 68.h, fit: BoxFit.cover),
        SizedBox(
          width: 8.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: iconPath == '' ? width.w : widthWithIcon.w,
              child: Text(
                title1,
                style: Styles.textStyle18,
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(
              height: 7.h,
            ),
            SizedBox(
              width: iconPath == '' ? width.w : widthWithIcon.w,
              child: Text(
                title2,
                style: Styles.textStyle22,
                textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
      ],
    ));
  }
}