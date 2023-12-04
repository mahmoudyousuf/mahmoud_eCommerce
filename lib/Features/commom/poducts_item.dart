import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mahmoud_task/Features/home/data/model/HomeData.dart';

import '../../core/assets.dart';
import '../../core/theme/colors.dart';
import '../../core/theme/decorations.dart';
import '../../core/theme/styles.dart';
import 'custom_icon.dart';
import 'offers_icon.dart';

class ProductItem extends StatelessWidget {
   ProductItem({Key? key , required this.productItem}) : super(key: key);

  ProductData productItem;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Center(child: Container(
        margin: EdgeInsets.zero,
        // width: 190.w,
        // height: 280.h,
        decoration: shadowContainer,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.h,
            ),
            FadeInImage(
                height: 120.h,
                width: 145.h,
                fit: BoxFit.fill,
                image: NetworkImage(
                  productItem.thumb!,

                ),
                placeholder: AssetImage(AssetsData.placeHolder) ,
              imageErrorBuilder:
                  (context, error, stackTrace) {
                return Image.asset(
                    AssetsData.placeHolder,
                    fit: BoxFit.fill);
              },

            ),
            SizedBox(
              height: 8.h,
            ),
            const Divider(
                thickness: 1, color: ColorsData.grayColor),
            Padding(
                padding: EdgeInsets.only(left: 8, right: 8),
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment:
                      CrossAxisAlignment.end,
                      mainAxisAlignment:
                      MainAxisAlignment.start,
                      children: [
                        Text(
                          '${productItem.salePrice}SAR',
                          style: Styles.textStyle16,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          '${productItem.normalPrice}SAR',
                          style: Styles.textStyle14Disabled,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 9.h,
                    ),
                    Text(
                      productItem.title!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyle14,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      children: [
                        RatingBar.builder(
                          ignoreGestures: true,
                          itemSize: 16,
                          initialRating: 3.5,
                          direction: Axis.horizontal,
                          itemCount: 5,
                          allowHalfRating: true,
                          itemPadding: const EdgeInsets.symmetric(
                              horizontal: 1.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            // setState(() {
                            //   ourRating = rating.toString();
                            // });
                            print(rating);
                          },
                        ),
                        const Text(
                          '(120)',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Styles.textStyle12,
                        ),
                      ],
                    ),

                  ],
                )),

            SizedBox(height: 16.h,)
          ],
        ),
      ),),
      Positioned(
          top: 12.h,
          right: 10.w,
          child: CustomIcon(
            iconPath: AssetsData.favoriteEmpty,
            buttonHandler: () {
            },
          )),
      Positioned(
        top: 12.h,
        left: 10.w,
        child: OffersIcon(
          discount: ("5") .toString() ,
          width: 65.w,
        ),
      )
    ]);
  }
}
