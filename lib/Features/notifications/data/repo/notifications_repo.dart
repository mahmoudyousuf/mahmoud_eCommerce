

import 'package:dartz/dartz.dart';

import '../../../../core/service/failures.dart';
import '../../../commom/model/notificationsModel.dart';

abstract class NotificationsRepo {
  Future<List<NotificationsModel>> getNotifications();
  void readAllNotifications();


}
