import 'package:get_it/get_it.dart';
import 'package:water_intake_reminder/data/datasources/isar_datasource_impl.dart';
import 'package:water_intake_reminder/domain/usecases/get_daily_goal_usecase.dart';

import '../../data/datasources/isar_datasource.dart';
import '../../data/repositories/repository_impl.dart';
import '../../domain/repositories/repository.dart';
import '../../domain/usecases/save_user_usecase.dart';
import '../../presentation/cubits/daily_goal/daily_goal_cubit.dart';
import '../../presentation/cubits/save_user/save_user_cubit.dart';

final sl = GetIt.instance;

regFactory<T extends Object>(T Function() factFunc) {
  sl.registerFactory(factFunc);
}

regSingleton<T extends Object>(T Function() factFunc) {
  sl.registerLazySingleton(factFunc);
}

void _saveUserInjector() {
  regSingleton(() => SaveUserCubit(sl()));
  regSingleton(() => SaveUserUsecase(sl()));
}

void _dailyGoalInjector() {
  regSingleton(() => GetUserCubit(sl()));
  regSingleton(() => GetUserUsecase(sl()));
}

void init() {
  _saveUserInjector();
  _dailyGoalInjector();

  regSingleton<Repository>(() => RepositoryImpl(sl()));
  regSingleton<LocalDatasource>(() => LocalDatasourceImpl());
}
