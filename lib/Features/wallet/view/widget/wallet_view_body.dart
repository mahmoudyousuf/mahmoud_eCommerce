import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:mahmoud_task/Features/wallet/manager/wallet_cubit.dart';
import 'package:mahmoud_task/Features/wallet/manager/wallet_state.dart';

import '../../../../../core/assets.dart';
import '../../../../core/app_router.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/decorations.dart';
import '../../../../core/theme/styles.dart';

import '../../../commom/custom_bottom_bar.dart';
import '../../../commom/global_top_bar.dart';
import '../../../commom/head_title.dart';

class WalletViewBody extends StatelessWidget {
  const WalletViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<WalletCubit, WalletState>(builder: (context, state) {
      context.read<WalletCubit>().getWalletData();

      return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            globalHeadBar(context),


            SizedBox(
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      context.read<WalletCubit>().addWalletData("tt");
                    },
                    child: HeadTitle(
                      title1: "Wallet",
                      title2: 'Check Yor Wallet',
                      iconPath: AssetsData.wallet,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height * .8,
              ),
              child: Container(
                width: double.infinity,
                decoration: shadowContainer,
                child: Padding(
                  padding: EdgeInsets.all(16.sp),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 24.h,
                      ),

                      state.walletModel
                          .cardHolderName == 'no data' ? SizedBox():
                      Container(
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
                                      AssetsData
                                          .bankCard,
                                      width: 48.w,
                                      height: 48.h,
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(right: 16.w),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              width: 250.w,
                                              child: Text(
                                                state.walletModel
                                                    .cardHolderName!,
                                                softWrap: false,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: Styles.textStyle14
                                                    .copyWith(
                                                        color: ColorsData
                                                            .secondaryTextColor),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 250.w,
                                              child: Text(
                                                state.walletModel.cardNumber!,
                                                softWrap: false,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: Styles.textStyle16
                                                    .copyWith(
                                                        color: ColorsData
                                                            .primaryColor),
                                              ),
                                            ),
                                          ],
                                        ))
                                  ],
                                ),
                              ],
                            ),
                          )),
                      SizedBox(
                        height: 24.h,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ))),
        bottomNavigationBar: CustomBottomBar(
          height: 120.h,
          bottomBarWidget: Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 16),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    GoRouter.of(context).push(AppRouter.kAddCardViewView);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorsData.primaryLightColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 16.h, bottom: 16.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          AssetsData.done,
                          width: 18.w,
                          height: 18.h,
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        Text('add New wallet'.toUpperCase(),
                            style: Styles.textStyle16
                                .copyWith(color: ColorsData.whiteColor)),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
