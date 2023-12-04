

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mahmoud_task/Features/splash/manager/splash_state.dart';

import '../../../../core/assets.dart';

import '../../manager/splash_cubit.dart';




class SplashViewBody extends StatelessWidget {
  const SplashViewBody({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    context.read<SplashCubit>().playSplash(context);


    return BlocBuilder<SplashCubit, SplashState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Image.asset(AssetsData.loading),
            ),
          ],
        );
      },
    );
  }


}


