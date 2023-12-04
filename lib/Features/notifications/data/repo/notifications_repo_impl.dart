import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:mahmoud_task/Features/commom/model/notificationsModel.dart';
import 'package:mahmoud_task/Features/notifications/data/repo/notifications_repo.dart';
import 'package:mahmoud_task/core/service/hive_functions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/service/api_service.dart';

class NotificationsRepoImpl implements NotificationsRepo {
  final ApiService apiService;

  NotificationsRepoImpl(this.apiService);

  @override
  Future<List<NotificationsModel>> getNotifications() {
    // TODO: implement getNotifications

    Future<List<NotificationsModel>> notificationsList;
    notificationsList = HiveFunctions.getNotificationList();

    return notificationsList;
  }

  @override
  void readAllNotifications() {
    // TODO: implement readAllNotifications
  }
}
