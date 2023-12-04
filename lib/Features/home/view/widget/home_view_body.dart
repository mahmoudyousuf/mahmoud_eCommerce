
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';

import 'package:mahmoud_task/Features/home/view/widget/images_slider.dart';

import '../../../../core/app_router.dart';

import '../../../commom/custom_loading_indicator.dart';
import '../../../commom/poducts_item.dart';
import '../../manager/home_cubit.dart';
import '../../manager/home_state.dart';
import 'home_top_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          switch (state.status) {
            case HomeStatus.initial:
              {
                return const Center(
                  child: CustomLoadingIndicator(),
                );
              }

            case HomeStatus.submitting:
              {
                return const Center(
                  child: CustomLoadingIndicator(),
                );
              }

            case HomeStatus.success:
              {
                return SafeArea(
                    child: SingleChildScrollView(
                        child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 16.h,
                    ),
                    const HomeTopBar(),
                    SizedBox(
                      height: 16.h,
                    ),
                    HomeImagesSlider(),
                    SizedBox(
                      height: 16.h,
                    ),
                    Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            MasonryGridView.count(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 20.w,
                              itemCount: state.model.data!.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                    onTap: () {
                                      GoRouter.of(context).push(
                                          AppRouter.kProductDetailsView,
                                          extra: state.model.data![index]);
                                    },
                                    child: ProductItem(
                                      productItem: state.model.data![index],
                                    ));
                              },
                            ),
                          ],
                        ))
                  ],
                )));
              }

            case HomeStatus.error:
              {
                return const Center(
                  child: Text('Something went wrong'),
                );
              }
              break;
          }
        });
  }
}
