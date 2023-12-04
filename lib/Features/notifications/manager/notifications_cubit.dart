import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:mahmoud_task/Features/notifications/data/repo/notifications_repo.dart';


import '../../../core/service/firbase_fuction.dart';
import 'notificatios_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit(this.repo) : super(NotificationsState.initial());
  final NotificationsRepo repo;


  void getNotifications() async {
    FirbaseFunctions.updateNewNotificationStatus('0') ;

    var result =  await repo.getNotifications();


      emit(state.copyWith( status: NotificationsStatus.success,notificationsList: result));

  }
}
