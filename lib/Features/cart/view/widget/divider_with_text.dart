import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mahmoud_task/core/theme/colors.dart';
import 'package:mahmoud_task/core/theme/styles.dart';

Widget dividerWithText() {
  return Padding(padding: EdgeInsets.only(top: 10.h,bottom: 10.h),child:Row(
    children:  <Widget>[
      const Expanded(
        child: SizedBox(
            child: Divider(
                thickness: 2,
      color: ColorsData.primaryColor),
      ),
      ),
      Padding(
          padding: EdgeInsets.only(left: 10.w, right: 10.w),
          child: const Text('Or',
              style: Styles.textStyle14

          )),
      const Expanded(
        child: SizedBox(
            child: Divider(
                thickness: 2,
                color: ColorsData.primaryColor),
      )),
    ],
  ));
}