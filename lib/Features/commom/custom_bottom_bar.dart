import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/theme/colors.dart';

class CustomBottomBar extends StatelessWidget {
  Widget bottomBarWidget;
  double height;

  CustomBottomBar({Key? key, required this.bottomBarWidget, this.height = 136})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.h,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0.w),
          topRight: Radius.circular(10.0.w),
        ),
        child: Container(
          decoration: const BoxDecoration(
            color: ColorsData.primaryColor,
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                offset: Offset(0, -2),
                color: Color(0x1F000000),
                spreadRadius: 0,
              ),
              BoxShadow(
                blurRadius: 5,
                offset: Offset(0, -2),
                color: Color(0x2F000000),
                spreadRadius: 0,
              )
            ],
          ),
          child: BottomAppBar(
            color: ColorsData.primaryColor,
            child: Padding(
                padding: EdgeInsets.only(left: 16.w, right: 16.w),
                child: bottomBarWidget),
          ),
        ),
      ),
    );
  }
}
