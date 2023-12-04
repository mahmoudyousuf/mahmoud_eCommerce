import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/service/api_service.dart';
import '../../../../core/service/failures.dart';
import '../model/HomeData.dart';
import 'home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;
  final SharedPreferences sharedPreferences;

  HomeRepoImpl(this.apiService, this.sharedPreferences);

  @override
  Future<Either<Failure, HomeData>> getHome() async {
    try {
      var response = await apiService.get(endPoint: 'api/1.0/deals');

      var model = HomeData.fromJson(response.data);

      if (200 <= response.code && response.code <= 300) {
        return right(model);
      } else {
        return left(Failure(response.errorMessage));
      }
    } catch (e) {
      if (e is DioError) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(ServerFailure(
        e.toString(),
      ));
    }
  }




}
