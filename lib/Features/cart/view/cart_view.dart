import 'package:flutter/material.dart';
import 'package:mahmoud_task/Features/cart/view/widget/cart_view_body.dart';
import 'package:mahmoud_task/Features/notifications/view/widget/notifications_view_body.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CartViewBody(),
    );
  }
}
