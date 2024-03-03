import 'package:isar/isar.dart';

part 'user.g.dart';

@Collection()
class User {
  User({
    this.dailyGoal,
    this.name,
    this.saved,
  });

  Id? id = Isar.autoIncrement;
  int? dailyGoal;
  String? name;
  bool? saved = false;
}
