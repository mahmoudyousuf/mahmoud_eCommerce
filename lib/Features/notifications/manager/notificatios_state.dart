import 'package:equatable/equatable.dart';
import 'package:mahmoud_task/Features/commom/model/notificationsModel.dart';

enum NotificationsStatus {submitting, success }

class NotificationsState extends Equatable {

  final NotificationsStatus status;
  final List<NotificationsModel> notificationsList;

  const NotificationsState({
    required this.status,
    required this.notificationsList,

  });

  factory NotificationsState.initial() {
    return const NotificationsState(
      status: NotificationsStatus.submitting,
      notificationsList: [],

    );
  }

  @override
  List<Object> get props => [status , notificationsList];

  NotificationsState copyWith({
    NotificationsStatus? status,
    List<NotificationsModel>? notificationsList,
  }) {
    return NotificationsState(
      status: status ?? this.status,
        notificationsList: notificationsList ?? this.notificationsList);
  }
}
