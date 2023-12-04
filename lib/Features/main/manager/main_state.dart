import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:mahmoud_task/Features/cart/view/cart_view.dart';
import 'package:mahmoud_task/Features/home/view/home_view.dart';

import '../../setting/view/setting_view.dart';


class MainState extends Equatable {


  final int pageIndex;
  final List pagesList;

  const MainState({
    required this.pageIndex,
    required this.pagesList,

  });

  factory MainState.initial() {
    return  const MainState(
      pageIndex: 0 ,
      pagesList:  [
        // HomeView(),
        Center(
          child: HomeView(),
        ),
        Center(
          child: Text("Favorite screen"),
        ),
        Center(
          child: CartView(),
        ),
        Center(
          child: SettingView(),
        ),

      ]
    );
  }

  @override
  List<Object> get props => [pageIndex , pagesList];

  MainState copyWith({
    int? pageIndex,

  }) {
    return MainState(
      pageIndex: pageIndex ?? this.pageIndex,
      pagesList: pagesList ,

    );
  }
}
