import 'package:equatable/equatable.dart';


class ProductDetailsState extends Equatable {

   int productCount;
   double productTotalPrice;

   ProductDetailsState({
    required this.productCount,
    required this.productTotalPrice,

  });

  factory ProductDetailsState.initial() {
    return  ProductDetailsState(
      productCount: 0,
      productTotalPrice: 0,

    );
  }

  @override
  List<Object> get props => [productCount , productTotalPrice];

  ProductDetailsState copyWith({
    int? productCount,
    double? productTotalPrice,
  }) {
    return ProductDetailsState(
        productCount: productCount ?? this.productCount,
        productTotalPrice: productTotalPrice ?? this.productTotalPrice);
  }
}
