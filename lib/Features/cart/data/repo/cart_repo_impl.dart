
import 'package:mahmoud_task/Features/cart/data/repo/cart_repo.dart';
import 'package:mahmoud_task/Features/commom/model/localProductModel.dart';

import 'package:mahmoud_task/core/service/hive_functions.dart';

import '../../../../core/service/api_service.dart';

class CartRepoImpl implements CartRepo {
  final ApiService apiService;

  CartRepoImpl(this.apiService);



  @override
  void readAllNotifications() {
    // TODO: implement readAllNotifications
  }

  @override
  Future<List<LocalProductModel>> getCart() {
    // TODO: implement getCart



    Future<List<LocalProductModel>> cartList;
    cartList = HiveFunctions.getCartList();

    return cartList;
  }
}
