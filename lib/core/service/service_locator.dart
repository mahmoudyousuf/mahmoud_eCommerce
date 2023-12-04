import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mahmoud_task/Features/cart/data/repo/cart_repo_impl.dart';
import 'package:mahmoud_task/Features/commom/model/localProductModel.dart';
import 'package:mahmoud_task/Features/notifications/data/repo/notifications_repo.dart';
import 'package:mahmoud_task/Features/notifications/data/repo/notifications_repo_impl.dart';
import 'package:mahmoud_task/core/service/hive_functions.dart';
import 'package:mahmoud_task/core/shared_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Features/commom/model/notificationsModel.dart';
import '../../Features/home/data/repo/home_repo_impl.dart';
import 'api_service.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  await _initSharedPref();


  // To intialise the hive database
  await Hive.initFlutter();

  Hive.registerAdapter(NotificationsModelAdapter());
  Hive.registerAdapter(LocalProductModelAdapter());

  // To open the user hive box
  await Hive.openBox<NotificationsModel>(SharedConstants.notificationsHiveBox);
  await Hive.openBox<LocalProductModel>(SharedConstants.localProductsHiveBox);





  getIt.registerSingleton<ApiService>(ApiService(
    Dio(),
    getIt.get<SharedPreferences>(),
  ));





  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(
    getIt.get<ApiService>(),
    getIt.get<SharedPreferences>(),
  ));



  getIt.registerSingleton<NotificationsRepoImpl>(NotificationsRepoImpl(
    getIt.get<ApiService>(),
  ));


  getIt.registerSingleton<CartRepoImpl>(CartRepoImpl(
    getIt.get<ApiService>(),
  ));



}

Future<void> _initSharedPref() async {
  final SharedPreferences sharedPref = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(sharedPref);
}
