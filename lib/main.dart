import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mahmoud_task/Features/cart/data/repo/cart_repo_impl.dart';
import 'package:mahmoud_task/Features/cart/manager/cart_cubit.dart';
import 'package:mahmoud_task/Features/commom/model/notificationsModel.dart';

import 'package:mahmoud_task/Features/wallet/manager/wallet_cubit.dart';
import 'package:mahmoud_task/core/service/firbase_fuction.dart';
import 'package:mahmoud_task/core/service/hive_functions.dart';

import 'Features/commom/model/localProductModel.dart';
import 'Features/home/data/repo/home_repo_impl.dart';
import 'Features/home/manager/home_cubit.dart';
import 'core/app_router.dart';
import 'core/service/push_notifications.dart';
import 'core/service/service_locator.dart';

// function to lisen to background changes
Future _firebaseBackgroundMessage(RemoteMessage message) async {
  if (message.notification != null) {
    FirbaseFunctions.updateNewNotificationStatus('1') ;

    HiveFunctions.createNotification(NotificationsModel(
        title: message.notification!.title!,
        contant: message.notification!.body!,
        IsReaded: false));
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  WidgetsFlutterBinding.ensureInitialized();


  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // // on background notification tapped
  // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
  //   if (message.notification != null) {
  //     print("Background Notification Tapped");
  //     // navigatorKey.currentState!.pushNamed("/message", arguments: message);
  //   }
  // });

  PushNotifications.init();
  PushNotifications.localNotiInit();
  FirebaseMessaging.onBackgroundMessage(_firebaseBackgroundMessage);

  // to handle foreground notifications
  FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
    String payloadData = jsonEncode(message.data);
    print("Got a message in foreground");
    if (message.notification != null) {


      FirbaseFunctions.updateNewNotificationStatus('1') ;

      HiveFunctions.createNotification(NotificationsModel(
          title: message.notification!.title!,
          contant: message.notification!.body!,
          IsReaded: false));

      PushNotifications.showSimpleNotification(
          title: message.notification!.title!,
          body: message.notification!.body!,
          payload: payloadData);
    }
  });

  // for handling in terminated state
  final RemoteMessage? message =
      await FirebaseMessaging.instance.getInitialMessage();

  if (message != null) {
    print("Launched from terminated state");
    Future.delayed(const Duration(seconds: 1), () {
      FirbaseFunctions.updateNewNotificationStatus('1') ;


      HiveFunctions.createNotification(NotificationsModel(
          title: message.notification!.title!,
          contant: message.notification!.body!,
          IsReaded: false));

      // navigatorKey.currentState!.pushNamed("/message", arguments: message);
    });
  }

  runApp( const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  Future<List<LocalProductModel>> getCart() {
    // TODO: implement getCart



    Future<List<LocalProductModel>> cartList;
    cartList = HiveFunctions.getCartList();

    return cartList;
  }
  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.paused) {

      List<LocalProductModel> cartList;
      cartList = await getCart();
      if(cartList.isNotEmpty){
        Future.delayed(const Duration(minutes: 3), () {


          PushNotifications.showSimpleNotification(
              title: 'your cart is waiting',
              body: 'complete your payment now',
              payload: '');

          FirbaseFunctions.updateNewNotificationStatus('1') ;
          HiveFunctions.createNotification(NotificationsModel(
              title: 'your cart is waiting',
              contant: 'complete your payment now',
              IsReaded: false));
        });
      }



    }
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: (context, child) {
          ScreenUtil.init(context, designSize: const Size(428, 926));
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => HomeCubit(
                  getIt.get<HomeRepoImpl>(),
                )
                  ..getHome()
                  ..readFirbaseRealTimedata(),
              ),


              BlocProvider(
                create: (context) => CartCubit(
                  getIt.get<CartRepoImpl>(),
                )
              ),


              BlocProvider(
                  create: (context) => WalletCubit(
                  )
              ),



            ],
            child: MaterialApp.router(
              routerConfig: AppRouter.router,
              theme: ThemeData.light().copyWith(
                  // scaffoldBackgroundColor: kPrimaryColor,
                  // scaffoldBackgroundColor: kPrimaryColor,

                  ),
            ),
          );
        });
  }
}
