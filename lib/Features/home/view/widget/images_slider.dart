import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mahmoud_task/core/theme/colors.dart';

import '../../../../core/assets.dart';
import '../../manager/home_cubit.dart';
import '../../manager/home_state.dart';



Widget adsWidget(BuildContext context , String item) {
  return Container(
    width: MediaQuery.of(context).size.width,
    margin: EdgeInsets.symmetric(horizontal: 5.0),
    decoration: BoxDecoration(color: ColorsData.primaryColor),
    child: FadeInImage(
        height: 120.h,
        width: 145.h,
        fit: BoxFit.fill,
        image: NetworkImage(
          item,
        ),
        placeholder: AssetImage(AssetsData.placeHolder)),);

}


class HomeImagesSlider extends StatelessWidget {
  HomeImagesSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      return state.adsData!.showAds == false || state.adsList.isEmpty
          ? SizedBox()
          : CarouselSlider(
              options: CarouselOptions(height: 200.h , autoPlay: true),

              items:


              state.adsList
                  .map((item) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(color: ColorsData.primaryColor),
                        child: FadeInImage(
                            height: 120.h,
                            width: 145.h,
                            fit: BoxFit.fill,
                            image: NetworkImage(
                              item,
                            ),
                            placeholder: const AssetImage(AssetsData.placeHolder)),);
                  },
                );
              }).toList(),



            );
    });
  }
}
