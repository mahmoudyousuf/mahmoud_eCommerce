import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:mahmoud_task/Features/home/manager/home_cubit.dart';
import 'package:mahmoud_task/Features/home/manager/home_state.dart';
import 'package:mahmoud_task/core/theme/colors.dart';
import 'package:mahmoud_task/core/theme/styles.dart';

import '../../../../core/app_router.dart';
import '../../../../core/assets.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50.0),
                  child: Image.asset(
                    AssetsData.personPlaceHolder,
                    width: 50,
                    height: 50,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Hello ',
                          style: Styles.textStyle16
                              .copyWith(color: ColorsData.grayColor),
                        ),
                        Text(
                          "Mahmoud Youssef",
                          style: Styles.textStyle16
                              .copyWith(color: ColorsData.primaryLightColor),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      "Welcome Back",
                      style: Styles.textStyle14
                          .copyWith(color: ColorsData.primaryColor),
                    ),
                  ],
                )
              ],
            ),

            BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
              return InkWell(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kNotificationsView);
                },
                child: SizedBox(
                  width: 35,
                  height: 35,
                  child: Stack(
                    children: [
                      SvgPicture.asset(AssetsData.notifications,
                          width: 35, height: 35, fit: BoxFit.scaleDown),
                      state.showNotificationDot == '0'
                          ? const SizedBox()
                          : Container(
                              width: 30,
                              height: 30,
                              alignment: Alignment.topRight,
                              margin: const EdgeInsets.only(top: 5),
                              child: Container(
                                width: 15,
                                height: 15,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: ColorsData.accentRedColor,
                                    border: Border.all(
                                        color: Colors.white, width: 1)),
                              ),
                            ),
                    ],
                  ),
                ),
              );
            })
            // CustomIcon(
            //   iconPath: 'alert-md-dark.svg',
            //   buttonHandler: () {
            //     GoRouter.of(context).push(AppRouter.kNotificationsView);
            //   },
            // ),
          ],
        ));
  }
}
