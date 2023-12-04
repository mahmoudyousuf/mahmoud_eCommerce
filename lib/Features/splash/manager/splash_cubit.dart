import 'package:bloc/bloc.dart';

import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:mahmoud_task/Features/splash/manager/splash_state.dart';

import '../../../core/app_router.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashState.initial());

  void playSplash(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 5),
      () {
        GoRouter.of(context).go(AppRouter.kMainView);
      },
    );
  }
}
