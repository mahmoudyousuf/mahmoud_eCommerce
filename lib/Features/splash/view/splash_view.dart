import 'package:flutter/material.dart';
import 'package:mahmoud_task/Features/home/view/widget/home_view_body.dart';
import 'package:mahmoud_task/Features/splash/view/widget/splash_view_body.dart';


class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashViewBody(),
    );
  }
}


