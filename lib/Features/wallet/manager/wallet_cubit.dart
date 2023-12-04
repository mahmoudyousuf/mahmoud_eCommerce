import 'package:bloc/bloc.dart';

import 'package:mahmoud_task/Features/commom/model/WalletModel.dart';

import 'package:mahmoud_task/Features/wallet/manager/wallet_state.dart';
import 'package:mahmoud_task/core/shared_constants.dart';

import '../../../core/service/secure_storge.dart';

class WalletCubit extends Cubit<WalletState> {
  WalletCubit() : super(WalletState.initial());

  Future<void> getWalletData() async {
     var savedCart = await SecureStorage.readSecureData(SharedConstants.localSavedWallet);

     if(savedCart == 'No data found!'){

     }else{

       emit(state.copyWith( walletModel: walletModelFromJson(savedCart)));

     }


  }



  Future<void> addWalletData(String data) async {
    await SecureStorage.writeSecureData(SharedConstants.localSavedWallet , data);



    getWalletData();


  }

}
