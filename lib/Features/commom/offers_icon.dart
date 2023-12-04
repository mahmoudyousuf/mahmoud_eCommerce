import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mahmoud_task/core/theme/colors.dart';
import 'package:mahmoud_task/core/theme/styles.dart';

import '../../core/theme/decorations.dart';

class OffersIcon extends StatelessWidget {
  const OffersIcon({Key? key , required this.discount ,required this.width}) : super(key: key);

  final String discount ;
  final double width ;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 40.h,
      decoration: shadowContainer.copyWith(color: ColorsData.accentRedColor),
      child: Padding(
        padding: EdgeInsets.all(8.sp),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$discount%',
              style: Styles.textStyle14.copyWith(color: ColorsData.whiteColor),

            ),
            Text(
              'off',
              style: Styles.textStyle12.copyWith(color: ColorsData.whiteColor),
            ),
          ],
        ),
      ),
    );
  }
}
