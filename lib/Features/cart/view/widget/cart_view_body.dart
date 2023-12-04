import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mahmoud_task/Features/cart/manager/cart_cubit.dart';
import 'package:mahmoud_task/Features/cart/manager/cart_state.dart';
import 'package:mahmoud_task/Features/cart/view/widget/cart_item.dart';

import 'package:mahmoud_task/core/theme/colors.dart';
import 'package:mahmoud_task/core/theme/styles.dart';

import '../../../../../core/assets.dart';
import '../../../../core/theme/decorations.dart';
import '../../../commom/custom_bottom_bar.dart';
import '../../../commom/global_top_bar.dart';
import '../../../commom/head_title.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<CartCubit>().getCart();

    return BlocConsumer<CartCubit, CartState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              body:  SafeArea(
              child: SingleChildScrollView(
                  child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        HeadTitle(
                          title1: 'Cart is ready',
                          title2: 'Checkout Now',
                          // title1: 'You’re successful',
                          // title2: state.totalPrice.toStringAsFixed(2),
                          width: 170,
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 16.w),
                          child: Column(
                            children: [
                              Text(
                                'Cart total',
                                style: Styles.textStyle18.copyWith(
                                    color: ColorsData.secondaryTextColor),
                              ),

                              SizedBox(height: 7.h,),
                              Row(
                                children: [
                                  Text(
                                    state.totalPrice.toStringAsFixed(2),
                                    style: Styles.textStyle24.copyWith(
                                        color: ColorsData.primaryLightColor),
                                  ),
                                  Text(
                                    ' SAR',
                                    style: Styles.textStyle24.copyWith(
                                        color: ColorsData.primaryLightColor),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height*.7  ,
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
                        MasonryGridView.count(
                          shrinkWrap: true,
                          crossAxisCount: 1,
                          mainAxisSpacing: 16.h,
                          crossAxisSpacing: 0,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.cartList.length,
                          itemBuilder: (context, index) {
                            return CartItem(
                              localProductModel: state.cartList[index],
                              index: index,
                            );
                          },
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ))) ,


            bottomNavigationBar:  CustomBottomBar(
              height: 120.h,
              bottomBarWidget: Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                child: Column(
                  children: [

                    ElevatedButton(
                      onPressed: () {
                        context.read<CartCubit>().getWalletData(context);

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
                            Text('checkout'.toUpperCase(),
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
