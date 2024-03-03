import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water_intake_reminder/presentation/cubits/daily_goal/daily_goal_cubit.dart';
import 'package:water_intake_reminder/presentation/cubits/save_user/save_user_cubit.dart';
import 'package:water_intake_reminder/presentation/screens/dashboard_screen.dart';

import 'core/utilities/di_service.dart' as di;

void main() async {
  // initialize di services
  di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.sl<SaveUserCubit>()),
        BlocProvider(create: (_) => di.sl<GetUserCubit>()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
          fontFamily: 'DM Sans',
        ),
        home: const DashboardScreen(),
      ),
    );
  }
}
