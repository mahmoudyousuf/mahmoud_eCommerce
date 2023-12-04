import 'package:bloc/bloc.dart';
import 'package:mahmoud_task/Features/main/manager/main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainState.initial());

  void changePageIndex(int index) {
    emit(state.copyWith(pageIndex: index));
  }
}
