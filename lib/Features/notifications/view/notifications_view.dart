import 'package:flutter/material.dart';
import 'package:mahmoud_task/Features/notifications/view/widget/notifications_view_body.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: NotificationsViewBody(),
    );
  }
}
