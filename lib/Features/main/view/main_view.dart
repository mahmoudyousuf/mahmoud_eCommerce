import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mahmoud_task/Features/home/view/home_view.dart';
import 'package:mahmoud_task/Features/main/manager/main_cubit.dart';
import 'package:mahmoud_task/Features/main/manager/main_state.dart';
import 'package:mahmoud_task/Features/main/view/widgit/main_view_body.dart';

import '../../../core/assets.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MainViewBody(),
    );
  }
}


