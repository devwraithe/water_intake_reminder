import 'package:water_intake_reminder/domain/repositories/repository.dart';

import '../entities/user.dart';

class SaveUserUsecase {
  final Repository _repo;
  SaveUserUsecase(this._repo);

  Future<void> execute(User user) async {
    return await _repo.saveUser(user);
  }
}
