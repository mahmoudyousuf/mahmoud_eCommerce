import 'package:flutter/material.dart';
import 'package:mahmoud_task/Features/commom/poducts_item.dart';
import 'package:mahmoud_task/Features/notifications/view/widget/notifications_view_body.dart';
import 'package:mahmoud_task/Features/productDetails/view/widget/product_details_view_body.dart';

import '../../home/data/model/HomeData.dart';

class ProductDetailsView extends StatelessWidget {
  ProductDetailsView({Key? key, required this.productItem}) : super(key: key);

  ProductData productItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProductDetailsViewBody(productItem: productItem),
    );
  }
}
