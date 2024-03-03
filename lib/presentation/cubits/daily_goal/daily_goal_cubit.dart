import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/get_daily_goal_usecase.dart';
import 'daily_goal_state.dart';

class GetUserCubit extends Cubit<GetUserState> {
  final GetUserUsecase _usecase;

  GetUserCubit(this._usecase) : super(GetUserInitial());

  Future<void> getUser() async {
    emit(GetUserLoading());

    try {
      final result = await _usecase.execute();
      emit(GetUserResponse(result));
      debugPrint("Result on cubit - ${result.dailyGoal}");
    } catch (error) {
      emit(GetUserError(error.toString()));
    }
  }
}
