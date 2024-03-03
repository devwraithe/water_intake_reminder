import 'package:flutter/cupertino.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:water_intake_reminder/domain/entities/user.dart';

import 'isar_datasource.dart';

class LocalDatasourceImpl implements LocalDatasource {
  late Future<Isar> isarDB;
  LocalDatasourceImpl() {
    isarDB = openIsarDB();
  }

  @override
  Future<void> saveUser(User user) async {
    try {
      final isar = await isarDB;
      await isar.writeTxn(() async {
        if (user.saved == false) {
          await isar.users.put(user..saved = true);
        } else {
          await isar.users.put(user);
        }
      });
      debugPrint("User info - ${user.name}, ${user.dailyGoal}, ${user.id}");
    } catch (e) {
      debugPrint('Error saving user: $e');
    }
  }

  @override
  Future<User> getUser() async {
    try {
      final isar = await isarDB;
      final users = await isar.users.where().findFirst();
      final userId = users!.id;
      final user = await isar.users.get(userId!);
      return user!;
    } catch (e) {
      debugPrint('Error getting daily goal: $e');
      return User();
    }
  }

  @override
  Future<bool> checkSaveStatus() async {
    try {
      final isar = await isarDB;
      final users = await isar.users.where().findFirst();
      final isSaved = users!.saved;
      return isSaved!;
    } catch (e) {
      debugPrint('Error getting save status: $e');
      return false;
    }
  }

  Future<Isar> openIsarDB() async {
    var dir = await getApplicationDocumentsDirectory();
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [UserSchema],
        directory: dir.path,
      );
    }
    return Future.value(Isar.getInstance());
  }
}
