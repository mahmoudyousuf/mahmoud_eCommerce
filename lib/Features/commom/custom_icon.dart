import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mahmoud_task/core/theme/colors.dart';

import '../../core/theme/decorations.dart';


class CustomIcon extends StatelessWidget {

  final String iconPath;
  final Function() buttonHandler;

  CustomIcon(
      {Key? key,
      required this.iconPath,
      required this.buttonHandler,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: buttonHandler,
      child: Container(
        decoration: shadowContainer.copyWith(color: ColorsData.accentGrayColor),
        child: SizedBox(
          height: 38.sp,
          width: 38.sp,
          child: SvgPicture.asset(iconPath,
              width: 18.w, height: 18.h, fit: BoxFit.scaleDown),
        ),
      ),
    );
  }
}
