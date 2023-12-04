
import 'package:hive/hive.dart';
part 'localProductModel.g.dart';

@HiveType(typeId: 1)
class LocalProductModel extends HiveObject {

  @HiveField(0)
   String productName;


  @HiveField(1)
   String productPrice;


  @HiveField(2)
   double productTotalPrice;

  @HiveField(3)
   int productCount;


  @HiveField(4)
  final String productImage;

  LocalProductModel(
      { required this.productName, required this.productPrice, required this.productTotalPrice
      , required this.productCount , required this.productImage
      });
}