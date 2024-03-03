import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water_intake_reminder/presentation/cubits/save_user/save_user_state.dart';

import '../../../domain/entities/user.dart';
import '../../../domain/usecases/save_user_usecase.dart';

class SaveUserCubit extends Cubit<SaveUserState> {
  final SaveUserUsecase _usecase;

  SaveUserCubit(this._usecase) : super(SaveUserInitial());

  Future<void> saveUser(User user) async {
    emit(SaveUserLoading());

    try {
      await _usecase.execute(user);
      // const SaveUserResponse("User added!");
    } catch (error) {
      emit(SaveUserResponse(error.toString()));
    }
  }
}
