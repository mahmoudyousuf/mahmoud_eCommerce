import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:mahmoud_task/Features/commom/model/localProductModel.dart';
import 'package:mahmoud_task/core/shared_constants.dart';

import '../../Features/commom/model/notificationsModel.dart';




class HiveFunctions {






  // Box which will use to store the things
  // static final notificationsBox = Hive.box(SharedConstants.notificationsHiveBox);

  static final notificationsBox = Hive.box<NotificationsModel>(SharedConstants.notificationsHiveBox);
  static final localProductsBox = Hive.box<LocalProductModel>(SharedConstants.localProductsHiveBox);



// Create or add single data in hive
static createNotification(NotificationsModel model) async {
  await notificationsBox.add(model);

}

// Create or add single data in hive
static Future<List<NotificationsModel>> getNotificationList() async {

  List<NotificationsModel>? notifications;

  var notificationsBox = Hive.box<NotificationsModel>(
      SharedConstants.notificationsHiveBox);

  notifications = notificationsBox.values.toList();
  return notifications ;

}




// Create or add single data in hive
  static addProductToCart(LocalProductModel model) async {
    await localProductsBox.add(model);

  }

  // Create or add single data in hive
  static editCartProduct(LocalProductModel model , int index) async {
    await localProductsBox.putAt( index, model);

  }



  // Create or add single data in hive
  static deleteProduct( int index) async {
    await localProductsBox.deleteAt( index);

  }


  // Create or add single data in hive
  static deleteAllProduct() async {
    await localProductsBox.clear();

  }


  // Create or add single data in hive
  static Future<List<LocalProductModel>> getCartList() async {

    List<LocalProductModel>? cart;

    var cartBox = Hive.box<LocalProductModel>(
        SharedConstants.localProductsHiveBox);

    cart = cartBox.values.toList();
    return cart ;

  }



  // // Create or add single data in hive
  // static createNotification(Map data) {
  //   notificationsBox.add(data);
  // }
  //
  // // Create or add multiple data in hive
  // static addAllNotifications(List data) {
  //   notificationsBox.addAll(data);
  // }
  //
  // // Get All data  stored in hive
  // static List getAllNotifications() {
  //   final data = notificationsBox.keys.map((key) {
  //     final value = notificationsBox.get(key);
  //     return {"key": key, "name": value["name"], "email": value['email']};
  //   }).toList();
  //
  //   return data.reversed.toList();
  // }
  //
  // // Get data for particular user in hive
  // static Map getNotification(int key) {
  //   return notificationsBox.get(key);
  // }
  //
  // // update data for particular user in hive
  // static updateNotification(int key, Map data) {
  //   notificationsBox.put(key, data);
  // }
  //
  // // delete data for particular user in hive
  // static deleteNotification(int key) {
  //   return notificationsBox.delete(key);
  // }
  //
  // // delete data for particular user in hive
  // static deleteAllNotifications(int key) {
  //   return notificationsBox.deleteAll(notificationsBox.keys);
  // }




}