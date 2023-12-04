import 'package:flutter/cupertino.dart';

import 'colors.dart';

abstract class Styles {


  static const textStyle16 = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w800,
      color: ColorsData.primaryLightColor
  );


  static const textStyle24 = TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w800,
      color: ColorsData.primaryColor
  );

  static const textStyle20 = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w800,
      color: ColorsData.secondaryTextColor
  );


  static const textStyle14 = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w800,
      color: ColorsData.primaryColor
  );

  static const textStyle18 = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w800,
      color: ColorsData.secondaryTextColor
  );


  static const textStyle22 = TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w800,
      color: ColorsData.primaryColor
  );


  static const textStyle12 = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w800,
      color: ColorsData.grayColor
  );

  static const textStyle14Disabled = TextStyle(
      fontSize: 14,
      decoration: TextDecoration
          .lineThrough,
      fontWeight: FontWeight.w800,
      color: ColorsData.grayColor
  );
  static const textStyle18Disabled = TextStyle(
      fontSize: 18,
      decoration: TextDecoration
          .lineThrough,
      fontWeight: FontWeight.w800,
      color: ColorsData.grayColor
  );


}

const TextStyle textStyle = TextStyle();
