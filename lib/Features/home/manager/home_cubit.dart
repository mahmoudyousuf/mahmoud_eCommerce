import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

import '../data/model/AdsData.dart';
import '../data/repo/home_repo.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.repo) : super(HomeState.initial());
  final HomeRepo repo;

  void readFirbaseRealTimedata() {
    final _database = FirebaseDatabase.instanceFor(
            app: Firebase.app(),
            databaseURL:
                "https://mahmoud-task-91156-default-rtdb.europe-west1.firebasedatabase.app/")
        .ref();

    _database.child('data').onValue.listen((event) {
      AdsData adsData = AdsData.fromJson(event.snapshot.value);

      for (var item in adsData.ads!) {
        if (item.isShowAd!) {
          if (!state.adsList.contains(item.adUrl)) {
            state.adsList.add(item.adUrl!);
          }
        } else {
          state.adsList.remove(item.adUrl!);
        }
      }

      emit(state.copyWith(adsData: adsData));
    });

    _database.child('showNewNotificatioDot').onValue.listen((event) {
      emit(
          state.copyWith(showNotificationDot: event.snapshot.value.toString()));
    });
  }

  void getHome() async {
    emit(state.copyWith(status: HomeStatus.submitting));
    var result = await repo.getHome();
    result.fold((failure) {
      emit(state.copyWith(failure: failure, status: HomeStatus.error));
    }, (model) {
      emit(state.copyWith(status: HomeStatus.success, model: model));
    });
  }
}
