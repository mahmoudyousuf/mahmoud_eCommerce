


import '../../../commom/model/localProductModel.dart';

abstract class CartRepo {
  Future<List<LocalProductModel>> getCart();

  void readAllNotifications();


}
