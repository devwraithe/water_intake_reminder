import 'package:water_intake_reminder/domain/entities/user.dart';

abstract class LocalDatasource {
  Future<void> saveUser(User user);
  Future<User> getUser();
  Future<bool> checkSaveStatus();
}
