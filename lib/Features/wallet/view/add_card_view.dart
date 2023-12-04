import 'package:flutter/material.dart';
import 'package:mahmoud_task/Features/wallet/view/widget/add_card_view_body.dart';
import 'package:mahmoud_task/Features/wallet/view/widget/wallet_view_body.dart';

class AddCardView extends StatelessWidget {
  const AddCardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AddCardViewBody(),
    );
  }
}
