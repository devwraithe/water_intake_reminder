import 'package:water_intake_reminder/data/datasources/isar_datasource.dart';
import 'package:water_intake_reminder/domain/entities/user.dart';

import '../../domain/repositories/repository.dart';

class RepositoryImpl implements Repository {
  final LocalDatasource localDatasource;

  RepositoryImpl(this.localDatasource);

  @override
  Future<void> saveUser(User user) async {
    await localDatasource.saveUser(user);
  }

  @override
  Future<User> getUser() async {
    final result = await localDatasource.getUser();
    return result;
  }
}
