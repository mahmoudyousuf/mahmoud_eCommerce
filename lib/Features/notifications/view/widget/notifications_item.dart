import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mahmoud_task/Features/commom/model/notificationsModel.dart';
import 'package:mahmoud_task/core/assets.dart';
import 'package:mahmoud_task/core/theme/colors.dart';

import '../../../../core/theme/decorations.dart';
import '../../../../core/theme/styles.dart';

class CustomNotificationItem extends StatelessWidget {
  final NotificationsModel notificationsModel;

  const CustomNotificationItem({Key? key, required this.notificationsModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: shadowContainer,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    AssetsData.notificationsRecivedPlaceHolder,
                    width: 48.w,
                    height: 48.h,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Padding(
                      padding: EdgeInsets.only(right: 16.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 250.w,
                            child: Text(
                              notificationsModel.title,
                              softWrap: false,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Styles.textStyle14.copyWith(
                                  color: ColorsData.secondaryTextColor),
                            ),
                          ),
                          SizedBox(
                            width: 250.w,
                            child: Text(
                              notificationsModel.contant,
                              softWrap: false,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Styles.textStyle16
                                  .copyWith(color: ColorsData.primaryColor),
                            ),
                          ),
                        ],
                      ))
                ],
              ),
            ],
          ),
        ));
  }
}
