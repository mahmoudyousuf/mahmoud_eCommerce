import 'package:flutter/material.dart';
import 'package:mahmoud_task/Features/wallet/view/widget/wallet_view_body.dart';

class WalletView extends StatelessWidget {
  const WalletView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: WalletViewBody(),
    );
  }
}
