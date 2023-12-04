import 'package:bloc/bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mahmoud_task/Features/commom/model/localProductModel.dart';
import 'package:mahmoud_task/Features/home/data/model/HomeData.dart';

import 'package:mahmoud_task/Features/productDetails/manager/product_details_state.dart';

import '../../../core/service/hive_functions.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetailsState.initial());

  void increment(double productPrice) {
    emit(state.copyWith(
        productCount: state.productCount + 1,
        productTotalPrice: state.productTotalPrice + productPrice));
  }

  void decrement(double productPrice) {
    if (state.productCount > 0) {
      emit(state.copyWith(
          productCount: state.productCount - 1,
          productTotalPrice: state.productTotalPrice - productPrice));
    }
  }

  void addToCart(ProductData productData) {
    HiveFunctions.addProductToCart(LocalProductModel(
        productName: productData.title!,
        productPrice: productData.salePrice!,
        productTotalPrice: state.productTotalPrice,
        productCount: state.productCount,
        productImage: productData.thumb!));

    Fluttertoast.showToast(
        msg: "Added to cart",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        fontSize: 16.0
    );
    emit(state.copyWith(productCount: 0, productTotalPrice: 0));


    

  }
// void getNotifications() async {
//   print("emit");
//
//   var result =  await repo.getNotifications();
//
//
//     emit(state.copyWith( status: NotificationsStatus.success,notificationsList: result));
//
// }
}
