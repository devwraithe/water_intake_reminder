import 'package:water_intake_reminder/domain/repositories/repository.dart';

import '../entities/user.dart';

class GetUserUsecase {
  final Repository _repo;
  GetUserUsecase(this._repo);

  Future<User> execute() async {
    return await _repo.getUser();
  }
}
