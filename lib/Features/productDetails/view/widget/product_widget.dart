import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/assets.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/decorations.dart';
import '../../../../core/theme/styles.dart';
import '../../../commom/custom_icon.dart';
import '../../../commom/offers_icon.dart';
import '../../../home/data/model/HomeData.dart';

class ProductDetailsProductData extends StatelessWidget {
  ProductDetailsProductData({Key? key, required this.productItem})
      : super(key: key);
  ProductData productItem;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Center(
          child: Container(
              width: double.infinity,
              decoration: shadowContainer,
              child: Column(
                children: [
                  SizedBox(
                    height: 16.h,
                  ),
                  FadeInImage(
                    height: 135.h,
                    width: 160.w,
                    fit: BoxFit.fill,
                    image: NetworkImage(
                      productItem.thumb!,
                    ),
                    placeholder: const AssetImage(AssetsData.placeHolder),
                    imageErrorBuilder: (context, error, stackTrace) {
                      return Image.asset(AssetsData.placeHolder, fit: BoxFit.fill);
                    },
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  const Divider(thickness: 1, color: ColorsData.grayColor),
                  SizedBox(
                    height: 16.h,
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 16.w, right: 16.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                '${productItem.salePrice}SAR',
                                style: Styles.textStyle24.copyWith(
                                    color: ColorsData.primaryLightColor),
                              ),
                              const SizedBox(
                                width: 3,
                              ),
                              Text(
                                '${productItem.normalPrice}SAR',
                                style: Styles.textStyle18Disabled,
                              ),
                              const SizedBox(
                                width: 3,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            productItem.title!,
                            style: Styles.textStyle24,
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          Row(
                            children: [
                              RatingBar.builder(
                                ignoreGestures: true,
                                itemSize: 20,
                                initialRating: 3.5,
                                direction: Axis.horizontal,
                                itemCount: 5,
                                allowHalfRating: true,
                                itemPadding:
                                    const EdgeInsets.symmetric(horizontal: 1.0),
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {},
                              ),
                              Text(
                                '(120)',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Styles.textStyle16.copyWith(
                                    color: ColorsData.secondaryTextColor),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          const Text(
                            'ron Man is a superhero appearing in American comic books published by Marvel Comics. Co-created by writer and editor Stan Lee, developed by scripter Larry Lieber, and designed by artists Don Heck and Jack Kirby, the character first appeared in Tales of Suspense #39 in 1963, and received his own title with Iron Man #1 in 1968. Shortly after his creation, Iron Man was a founding member of a superhero team, the Avengers, with Thor, Ant-Man, Wasp and the Hulk. Iron Man stories, individually and with the Avengers, have been published consistently since the character',
                            style: Styles.textStyle16,
                          ),
                          SizedBox(
                            height: 50.h,
                          )
                        ],
                      )),
                ],
              ))),
      Positioned(
          top: 12.h,
          right: 10.w,
          child: CustomIcon(
            iconPath: AssetsData.favoriteEmpty,
            buttonHandler: () {
              // print('fevorite');
            },
          )),
      Positioned(
        top: 12.h,
        left: 10.w,
        child: OffersIcon(
          discount: ("5").toString(),
          width: 80.w,
        ),
      )
    ]);
  }
}
