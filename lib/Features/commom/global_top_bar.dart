import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mahmoud_task/core/assets.dart';
import 'package:mahmoud_task/core/theme/colors.dart';
import 'package:mahmoud_task/core/theme/styles.dart';

import 'custom_icon.dart';

Widget globalHeadBar(BuildContext context) {
  return
      Padding(padding:EdgeInsets.only(left: 16.w ,right: 16.w, top: 16.h)  , child:Row(
        children: [


          CustomIcon(
            iconPath: AssetsData.back,
            buttonHandler: () {
              Navigator.pop(context);
            },
          ),
          SizedBox(
            width: 5.w,
          ),
          Text(
            'Back',
            style: Styles.textStyle14.copyWith(color: ColorsData.primaryColor),
          )
        ],

  ));
}