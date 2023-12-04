import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mahmoud_task/Features/home/data/model/HomeData.dart';
import 'package:mahmoud_task/Features/productDetails/manager/product_details_cubit.dart';
import 'package:mahmoud_task/Features/productDetails/manager/product_details_state.dart';
import 'package:mahmoud_task/Features/productDetails/view/widget/product_widget.dart';

import '../../../../core/assets.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/decorations.dart';
import '../../../../core/theme/styles.dart';
import '../../../commom/custom_bottom_bar.dart';
import '../../../commom/custom_icon.dart';
import '../../../commom/global_top_bar.dart';
import '../../../commom/offers_icon.dart';

class ProductDetailsViewBody extends StatelessWidget {
  ProductDetailsViewBody({Key? key, required this.productItem})
      : super(key: key);

  ProductData productItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(children: [
          globalHeadBar(context),
          SizedBox(
            height: 24.h,
          ),
          ProductDetailsProductData(
            productItem: productItem,
          ),
        ]))),
        bottomNavigationBar: BlocConsumer<ProductDetailsCubit,
                ProductDetailsState>(
            listener: (context, state) {},
            builder: (context, state) {
              return CustomBottomBar(
                height: 170,
                bottomBarWidget: Padding(
                  padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                  child: Column(
                    children: [
                      Container(
                          width: 358.w,
                          height: 52.h,
                          decoration: shadowContainer,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    width: 37.w,
                                  ),
                                  Text(
                                    state.productTotalPrice.toStringAsFixed(2),
                                    style: Styles.textStyle16,
                                  ),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  const Text(
                                    'SAR',
                                    style: Styles.textStyle16,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CustomIcon(
                                    iconPath: AssetsData.minus,
                                    buttonHandler: () {
                                      context
                                          .read<ProductDetailsCubit>()
                                          .decrement(double.parse(productItem.salePrice!));
                                    },
                                  ),
                                  SizedBox(
                                    width: 16.w,
                                  ),
                                  Container(
                                    height: 38.sp,
                                    width: 38.sp,
                                    decoration: BoxDecoration(
                                      color: ColorsData.accentGrayColor,
                                      border: Border.all(
                                          color: ColorsData.accentGrayColor,
                                          width: 0),
                                      borderRadius: BorderRadius.circular(13),
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 10,
                                          offset: Offset(0, 2),
                                          color: Color(0xff000000)
                                              .withOpacity(.12),
                                          spreadRadius: 0,
                                        ),
                                        BoxShadow(
                                          blurRadius: 5,
                                          offset: const Offset(0, 2),
                                          color: const Color(0xff000000)
                                              .withOpacity(.16),
                                          spreadRadius: 0,
                                        )
                                      ],
                                    ),
                                    child: Center(
                                      child: Text(
                                        state.productCount.toString(),
                                        style: Styles.textStyle16.copyWith(
                                            color: ColorsData.primaryColor),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 16.w,
                                  ),
                                  CustomIcon(
                                    iconPath: AssetsData.plus,
                                    buttonHandler: () {
                                      context
                                          .read<ProductDetailsCubit>()
                                          .increment(double.parse(productItem.salePrice!));
                                    },
                                  ),
                                  SizedBox(
                                    width: 9.w,
                                  ),
                                ],
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 16.h,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          context
                              .read<ProductDetailsCubit>()
                              .addToCart(productItem);
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
                                AssetsData.cartPlus,
                                width: 18.w,
                                height: 18.h,
                              ),
                              SizedBox(
                                width: 4.w,
                              ),
                              Text('ADD TO CART'.toUpperCase(),
                                  style: Styles.textStyle16
                                      .copyWith(color: ColorsData.whiteColor)),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }));
  }
}
