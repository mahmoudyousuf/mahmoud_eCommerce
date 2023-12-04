import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:mahmoud_task/core/theme/colors.dart';

import '../../../../core/app_router.dart';
import '../../../../core/assets.dart';
import '../../../../core/theme/decorations.dart';
import '../../../../core/theme/styles.dart';
import '../../../commom/head_title.dart';
import '../../../commom/model/WalletModel.dart';
import '../../manager/cart_cubit.dart';
import 'divider_with_text.dart';

dynamic checkoutBottomSheet(
    BuildContext context, WalletModel walletModel, Function() confirm) {
  return showModalBottomSheet(
      elevation: 2.0,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16.0))),
      context: context,
      isScrollControlled: true,
      builder: (context) => Container(
          constraints: BoxConstraints(minHeight: 400.h),
          decoration: shadowContainer,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                height: 20.h,
              ),
              Container(
                height: 4.h,
                width: 42.w,
                decoration: const BoxDecoration(
                  color: ColorsData.accentGrayColor,
                ),
              ),
              SizedBox(
                height: 26.h,
              ),
              HeadTitle(
                title1: 'Order ready',
                title2: 'Checkout now',
              ),
              SizedBox(
                height: 26.h,
              ),
              walletModel.cardNumber == 'no data'
                  ? const SizedBox()
                  : Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);

                            context.read<CartCubit>().confirmCheckout();



                            Fluttertoast.showToast(
                                msg: "Your order placed successfully",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                fontSize: 16.0
                            );
                          },
                          child: Container(
                              width: double.infinity,
                              decoration: shadowContainer,
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SvgPicture.asset(
                                          AssetsData.bankCard,
                                          width: 48.w,
                                          height: 48.h,
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        Padding(
                                            padding:
                                                EdgeInsets.only(right: 16.w),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  width: 250.w,
                                                  child: Text(
                                                    walletModel.cardHolderName!,
                                                    softWrap: false,
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: Styles.textStyle14
                                                        .copyWith(
                                                            color: ColorsData
                                                                .secondaryTextColor),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 250.w,
                                                  child: Text(
                                                    walletModel.cardNumber!,
                                                    softWrap: false,
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
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
                        ),
                        dividerWithText(),
                      ],
                    ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                  GoRouter.of(context).push(AppRouter.kWalletView);
                },
                child: Container(
                    width: double.infinity,
                    decoration: shadowContainer,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: SizedBox(
                        width: 250.w,
                        child: Text(
                          'Add new wallet',
                          softWrap: false,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Styles.textStyle16
                              .copyWith(color: ColorsData.primaryColor),
                        ),
                      ),
                    )),
              ),
              SizedBox(
                height: 60.h,
              ),
            ],
          )));
}
