import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:mahmoud_task/Features/cart/data/repo/cart_repo.dart';
import 'package:mahmoud_task/Features/cart/manager/cart_state.dart';
import 'package:mahmoud_task/Features/commom/model/localProductModel.dart';
import 'package:mahmoud_task/Features/notifications/data/repo/notifications_repo.dart';
import 'package:mahmoud_task/core/service/hive_functions.dart';

import '../../../core/service/secure_storge.dart';
import '../../../core/shared_constants.dart';
import '../../commom/model/WalletModel.dart';
import '../view/widget/checkout_bottom_sheet.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.repo) : super(CartState.initial());
  final CartRepo repo;

  void getCart() async {
    print("emit");

    var result = await repo.getCart();
    state.totalPrice = 0 ;
    for(var item in result){
      state.totalPrice = state.totalPrice + item.productTotalPrice ;
    }

    emit(state.copyWith(cartList: result  , totalPrice: state.totalPrice ));
  }

  Future<void> increment(int index) async {

    LocalProductModel localProductModel;
    localProductModel = state.cartList[index];
    localProductModel.productCount = localProductModel.productCount + 1;
    localProductModel.productTotalPrice = localProductModel.productTotalPrice + double.parse(localProductModel.productPrice);
    await HiveFunctions.editCartProduct(localProductModel, index);

    var result = await repo.getCart();


    emit(state.copyWith( cartList: result , totalPrice: state.totalPrice + double.parse(result[index].productPrice )));

  }


  Future<void> decrement(int index) async {


    if(state.cartList[index].productCount > 1 ){
      LocalProductModel localProductModel;
      localProductModel = state.cartList[index];
      localProductModel.productCount = localProductModel.productCount - 1;
      localProductModel.productTotalPrice = localProductModel.productTotalPrice - double.parse(localProductModel.productPrice);
      await HiveFunctions.editCartProduct(localProductModel, index);

      var result = await repo.getCart();



      emit(state.copyWith( cartList: result , totalPrice: state.totalPrice - double.parse(result[index].productPrice )));

    }

  }




  Future<void> delete(int index) async {



      LocalProductModel localProductModel;
      localProductModel = state.cartList[index];


      await HiveFunctions.deleteProduct( index);

      getCart();



  }


  Future<void> confirmCheckout() async {



    await HiveFunctions.deleteAllProduct();

    getCart();



  }


  Future<void> getWalletData(BuildContext context) async {
    var walletData = await SecureStorage.readSecureData(SharedConstants.localSavedWallet);





    if(walletData != "No data found!"){
      emit(state.copyWith( walletModel: walletModelFromJson(walletData)));

    }

      checkoutBottomSheet(context , state.walletModel , (){

      });

    // }


  }




}
