import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mahmoud_task/Features/cart/manager/cart_cubit.dart';
import 'package:mahmoud_task/Features/cart/manager/cart_state.dart';
import 'package:mahmoud_task/Features/commom/model/localProductModel.dart';
import 'package:mahmoud_task/core/theme/colors.dart';

import '../../../../core/assets.dart';
import '../../../../core/theme/decorations.dart';
import '../../../../core/theme/styles.dart';
import '../../../commom/custom_icon.dart';

class CartItem extends StatelessWidget {
  CartItem({Key? key, required this.localProductModel , required this.index}) : super(key: key);

  LocalProductModel localProductModel;
  int index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(builder: (context, state) {
      return Container(
        width: 358.w,
        decoration: shadowContainer,
        child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Row(
              children: [
                FadeInImage(
                  width: 91.w,
                  height: 96.h,
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    localProductModel.productImage!,
                  ),
                  placeholder: const AssetImage(AssetsData.placeHolder),
                  imageErrorBuilder: (context, error, stackTrace) {
                    return Image.asset(AssetsData.placeHolder, fit: BoxFit.fill);
                  },
                ),


                const VerticalDivider(
                  color: ColorsData.secondaryTextColor,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 12, bottom: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          localProductModel.productPrice.toString(),
                                          style: Styles.textStyle16,
                                        ),
                                        const Text(
                                          'SAR',
                                          style: Styles.textStyle16,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              localProductModel.productName,
                              style: Styles.textStyle14,
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CustomIcon(
                                  iconPath: AssetsData.minus,
                                  buttonHandler: () {
                                    context.read<CartCubit>().decrement(index);

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
                                        offset: const Offset(0, 2),
                                        color:
                                            const Color(0xff000000).withOpacity(.12),
                                        spreadRadius: 0,
                                      ),
                                      BoxShadow(
                                        blurRadius: 5,
                                        offset: Offset(0, 2),
                                        color:
                                            Color(0xff000000).withOpacity(.16),
                                        spreadRadius: 0,
                                      )
                                    ],
                                  ),
                                  child: Center(
                                    child: Text(
                                      state.cartList[index].productCount.toString(),
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
                                    context.read<CartCubit>().increment(index);
                                  },
                                ),
                                SizedBox(
                                  width: 9.w,
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () {
                                context.read<CartCubit>().delete(index);

                              },
                              child: Container(
                                decoration: shadowContainer.copyWith(
                                    color: ColorsData.accentRedColor),
                                child: SizedBox(
                                  height: 38.sp,
                                  width: 38.sp,
                                  child: SvgPicture.asset(AssetsData.remove,
                                      width: 18.w,
                                      height: 18.h,
                                      fit: BoxFit.scaleDown),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
      );
    });
  }
}
