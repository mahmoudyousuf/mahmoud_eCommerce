import 'package:flutter/material.dart';
import 'package:mahmoud_task/Features/notifications/view/widget/notifications_view_body.dart';
import 'package:mahmoud_task/Features/setting/view/widget/setting_view_body.dart';

class SettingView extends StatelessWidget {
  const SettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SettingViewBody(),
    );
  }
}
