

import 'package:dartz/dartz.dart';

import '../../../../core/service/failures.dart';
import '../model/HomeData.dart';

abstract class HomeRepo {
  Future<Either<Failure, HomeData>> getHome();


}
