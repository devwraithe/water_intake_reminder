import 'package:water_intake_reminder/domain/entities/user.dart';

abstract class Repository {
  Future<void> saveUser(User user);
  Future<User> getUser();
}
