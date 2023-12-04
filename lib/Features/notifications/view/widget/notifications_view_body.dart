import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mahmoud_task/Features/notifications/manager/notifications_cubit.dart';
import 'package:mahmoud_task/Features/notifications/manager/notificatios_state.dart';

import '../../../../../core/assets.dart';
import '../../../../core/theme/decorations.dart';
import '../../../commom/custom_loading_indicator.dart';
import '../../../commom/global_top_bar.dart';
import '../../../commom/head_title.dart';
import 'notifications_item.dart';

class NotificationsViewBody extends StatelessWidget {
  const NotificationsViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<NotificationsCubit>().getNotifications();

    return BlocBuilder<NotificationsCubit, NotificationsState>(
        builder: (context, state) {
          switch (state.status) {
            case NotificationsStatus.submitting:
              {
                return const Center(
                  child: CustomLoadingIndicator(),
                );
              }

            case NotificationsStatus.success:
              {
                return SafeArea(
                    child: SingleChildScrollView(
                        child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    globalHeadBar(context),
                    HeadTitle(
                      title1: 'You’re successful',
                      title2: 'Notifications',
                      iconPath: AssetsData.notifications,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: MediaQuery.of(context).size.height*.8,
                      ),
                      child: Container(
                        width: double.infinity,
                        decoration: shadowContainer,
                        child: Padding(
                          padding: EdgeInsets.all(16.sp),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 24.h,
                              ),
                              MasonryGridView.count(
                                shrinkWrap: true,
                                crossAxisCount: 1,
                                mainAxisSpacing: 16.h,
                                reverse: true,
                                crossAxisSpacing: 0,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: state.notificationsList.length,
                                itemBuilder: (context, index) {
                                  return CustomNotificationItem(
                                    notificationsModel:
                                        state.notificationsList[index],
                                  );
                                },
                              ),
                              SizedBox(
                                height: 24.h,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )));
              }
          }
        });
  }
}
