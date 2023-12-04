import 'package:equatable/equatable.dart';
import 'package:mahmoud_task/Features/commom/model/WalletModel.dart';
import 'package:mahmoud_task/Features/commom/model/localProductModel.dart';
import 'package:mahmoud_task/Features/commom/model/notificationsModel.dart';

enum CartStatus {submitting, success }

class CartState extends Equatable {

   CartStatus status;
   List<LocalProductModel> cartList;
   double totalPrice;
   WalletModel walletModel;

   CartState({
    required this.status,
    required this.cartList,
     required this.totalPrice,
     required this.walletModel

  });

  factory CartState.initial() {
    return  CartState(
      status: CartStatus.submitting,
      cartList: [],
      totalPrice: 0,
      walletModel: WalletModel(cardNumber: "no data" , cardHolderName: "no data", cvvCode: "no data" , expireDate: "no data") ,


    );
  }

  @override
  List<Object> get props => [status , cartList , totalPrice , walletModel];

  CartState copyWith({
    CartStatus? status,
    List<LocalProductModel>? cartList,
    double? totalPrice ,
    WalletModel? walletModel
  }) {
    return CartState(
      status: status ?? this.status,
        cartList: cartList ?? this.cartList,
        totalPrice: totalPrice ?? this.totalPrice,
      walletModel: walletModel ?? this.walletModel
    );
  }
}
