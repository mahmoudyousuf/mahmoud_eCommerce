import 'package:equatable/equatable.dart';
import 'package:mahmoud_task/Features/home/data/model/AdsData.dart';

import '../../../core/service/failures.dart';
import '../data/model/HomeData.dart';

enum HomeStatus { initial, submitting, success, error }

class HomeState extends Equatable {
  final HomeStatus status;
  final HomeData model;
  final Failure failure;
  final AdsData adsData;
  final List<String> adsList;
  final String showNotificationDot;

  const HomeState({
    required this.status,
    required this.model,
    required this.failure,
    required this.adsData,
    required this.adsList,
    required this.showNotificationDot
  });

  factory HomeState.initial() {
    return HomeState(
      status: HomeStatus.initial,
      model: HomeData(),
      failure: const Failure(""),
      adsData: AdsData(),
      adsList: [],
      showNotificationDot: '0'
    );
  }

  @override
  List<Object> get props => [status, model, failure, adsData, adsList , showNotificationDot];

  HomeState copyWith(
      {HomeStatus? status,
      HomeData? model,
      Failure? failure,
      AdsData? adsData,
      List<String>? adsList,
        String? showNotificationDot

      }) {
    return HomeState(
        status: status ?? this.status,
        model: model ?? this.model,
        failure: failure ?? this.failure,
        adsData: adsData ?? this.adsData,
        adsList: adsList ?? this.adsList,
      showNotificationDot: showNotificationDot ?? this.showNotificationDot

    );
  }
}
