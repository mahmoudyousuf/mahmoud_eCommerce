import 'package:equatable/equatable.dart';
import 'package:mahmoud_task/Features/commom/model/localProductModel.dart';
import 'package:mahmoud_task/Features/commom/model/notificationsModel.dart';

import '../../commom/model/WalletModel.dart';

enum WalletStatus {foundWallet, notFoundWallet }

class WalletState extends Equatable {

   WalletStatus status;
   WalletModel walletModel;



   WalletState({
    required this.status,
    required this.walletModel,


  });

  factory WalletState.initial() {
    return  WalletState(
      status: WalletStatus.notFoundWallet,
      walletModel: WalletModel(cardNumber: "no data" , cardHolderName: "no data", cvvCode: "no data" , expireDate: "no data") ,


    );
  }

  @override
  List<Object> get props => [status , walletModel ];

  WalletState copyWith({
    WalletStatus? status,
    WalletModel? walletModel,

  }) {
    return WalletState(
      status: status ?? this.status,
        walletModel: walletModel ?? this.walletModel ,

    );
  }
}
