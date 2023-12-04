import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';


import '../../../../../core/assets.dart';
import '../../../../core/app_router.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/decorations.dart';
import '../../../../core/theme/styles.dart';
import '../../../commom/head_title.dart';

class SettingViewBody extends StatelessWidget {
  const SettingViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        HeadTitle(
          title1: 'Setting',
          title2: 'Mahmoud Youssef',
        ),
        SizedBox(
          height: 20.h,
        ),
        Padding(
          padding: EdgeInsets.all(16.sp),
          child: InkWell(

            onTap: (){

              GoRouter.of(context).push(AppRouter.kWalletView );

            },
            child: Container(
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
                          AssetsData.wallet,
                          width: 48.w,
                          height: 48.h,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        SizedBox(
                          width: 250.w,
                          child: Text(
                            "wallet",
                            softWrap: false,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Styles.textStyle18
                                .copyWith(color: ColorsData.primaryColor),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )),),
        ),
      ],
    )));
  }
}
