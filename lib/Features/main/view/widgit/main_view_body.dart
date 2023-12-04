import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/assets.dart';
import '../../manager/main_cubit.dart';
import '../../manager/main_state.dart';

class MainViewBody extends StatelessWidget {
  const MainViewBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: state.pagesList[state.pageIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: state.pageIndex,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              type: BottomNavigationBarType.fixed,
              onTap: (index) =>
                  context.read<MainCubit>().changePageIndex(index),
              items: [
                BottomNavigationBarItem(
                    activeIcon: SvgPicture.asset(
                      AssetsData.homeSelected,
                    ),
                    icon: SvgPicture.asset(AssetsData.home),
                    label: 'Home'),
                BottomNavigationBarItem(
                  activeIcon: SvgPicture.asset(
                    AssetsData.favoriteSelected,
                  ),
                  icon: SvgPicture.asset(AssetsData.favorite),
                  label: 'Favorite',
                ),
                BottomNavigationBarItem(
                    activeIcon: SvgPicture.asset(
                      AssetsData.cartSelected,
                    ),
                    icon: SvgPicture.asset(AssetsData.cart),
                    label: 'Cart'),
                BottomNavigationBarItem(
                    activeIcon: SvgPicture.asset(
                      AssetsData.menuSelected,
                    ),
                    icon: SvgPicture.asset(AssetsData.menu),
                    label: 'Settings'),
              ],
            ),
          );
        });
  }
}