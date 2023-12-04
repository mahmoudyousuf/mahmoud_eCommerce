import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mahmoud_task/Features/cart/data/repo/cart_repo_impl.dart';
import 'package:mahmoud_task/Features/cart/manager/cart_cubit.dart';
import 'package:mahmoud_task/Features/cart/view/cart_view.dart';
import 'package:mahmoud_task/Features/home/data/repo/home_repo_impl.dart';
import 'package:mahmoud_task/Features/home/manager/home_cubit.dart';
import 'package:mahmoud_task/Features/home/view/home_view.dart';
import 'package:mahmoud_task/Features/main/manager/main_cubit.dart';
import 'package:mahmoud_task/Features/notifications/data/repo/notifications_repo_impl.dart';
import 'package:mahmoud_task/Features/notifications/manager/notifications_cubit.dart';
import 'package:mahmoud_task/Features/notifications/view/notifications_view.dart';
import 'package:mahmoud_task/Features/productDetails/manager/product_details_cubit.dart';
import 'package:mahmoud_task/Features/productDetails/view/product_details_view.dart';
import 'package:mahmoud_task/Features/setting/view/setting_view.dart';
import 'package:mahmoud_task/Features/splash/manager/splash_cubit.dart';
import 'package:mahmoud_task/Features/splash/view/splash_view.dart';
import 'package:mahmoud_task/Features/wallet/manager/wallet_cubit.dart';
import 'package:mahmoud_task/Features/wallet/view/add_card_view.dart';
import 'package:mahmoud_task/Features/wallet/view/wallet_view.dart';
import 'package:mahmoud_task/core/service/service_locator.dart';

import '../Features/home/data/model/HomeData.dart';
import '../Features/main/view/main_view.dart';


abstract class AppRouter {
  static const kSplashView = '/splashView';
  static const kMainView = '/mainView';
  static const kHomeView = '/homeView';
  static const kNotificationsView = '/notificationsView';
  static const kCartView = '/cartView';
  static const kWalletView = '/walletView';
  static const kProductDetailsView = '/productDetailsView';
  static const kSettingView = '/settingView';
  static const kAddCardViewView = '/addCardView';


  static final router = GoRouter(
    routes: [
      // GoRoute(
      //   path: '/',
      //   builder: (context, state) => BlocProvider(
      //     create: (context) => SplashCubit(
      //       getIt.get<SplashRepoImpl>(),
      //     ),
      //     child: const SplashView() /* SessionEndView RateView */,
      //     // child: const ChattingView() /* SessionEndView RateView */,
      //   ),
      // ),

      GoRoute(
        path: "/",
        builder: (context, state) => BlocProvider(
          create: (context) => SplashCubit(
          ),
          child: const SplashView() ,
        ),
      ),



      GoRoute(
        path: kMainView,
        builder: (context, state) => BlocProvider(
          create: (context) => MainCubit(
          ),
          child: const MainView()
        ),
      ),


      GoRoute(
        path: kHomeView,
        builder: (context, state) => BlocProvider(
          create: (context) => HomeCubit(
            getIt.get<HomeRepoImpl>(),
          ),
          child: const HomeView()
        ),
      ),


      GoRoute(
        path: kNotificationsView,
        builder: (context, state) => BlocProvider(
            create: (context) => NotificationsCubit(
              getIt.get<NotificationsRepoImpl>(),
            ),
            child: const NotificationsView()
        ),
      ),




      GoRoute(
        path: kCartView,
        builder: (context, state) => BlocProvider(
            create: (context) => CartCubit(
              getIt.get<CartRepoImpl>(),
            ),
            child: const CartView()
        ),
      ),


      GoRoute(
        path: kProductDetailsView,
        builder: (context, state) => BlocProvider(
            create: (context) => ProductDetailsCubit(
            ),
            child:  ProductDetailsView(productItem:  state.extra as ProductData ,)
        ),
      ),




      GoRoute(
        path: kWalletView,
        builder: (context, state) => BlocProvider(
            create: (context) => WalletCubit(
            ),
            child: const WalletView()
        ),
      ),


      GoRoute(
        path: kSettingView,
        builder: (context, state) => const SettingView(),
      ),




      GoRoute(
        path: kAddCardViewView,
  builder: (context, state) => const AddCardView(),


      ),




      // GoRoute(
      //   path: kAddCardViewView,
      //   builder: (context, state) => const AddCardView(),
      // ),

    ],
  );
}
