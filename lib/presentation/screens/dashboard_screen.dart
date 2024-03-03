import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:water_intake_reminder/core/helpers/constants.dart';
import 'package:water_intake_reminder/presentation/cubits/daily_goal/daily_goal_cubit.dart';
import 'package:water_intake_reminder/presentation/cubits/daily_goal/daily_goal_state.dart';
import 'package:water_intake_reminder/presentation/screens/tabs/home_tab.dart';
import 'package:water_intake_reminder/presentation/screens/tabs/logs_tab.dart';
import 'package:water_intake_reminder/presentation/screens/tabs/settings_tab.dart';

import '../../core/helpers/icon_helper.dart';
import '../../core/helpers/text_style_helper.dart';
import '../../domain/entities/user.dart';
import '../cubits/save_user/save_user_cubit.dart';
import '../widgets/metric.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedTab = 0;

  final _tabs = const [
    HomeTab(),
    LogsTab(),
    SettingsTab(),
  ];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetUserCubit>(context).getUser();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   _setUserName();
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<GetUserCubit, GetUserState>(
          listener: (context, state) {
            if (state is GetUserResponse) {
              if (state.user.saved != true) {
                _setUserName();
              }
            }
          },
          child: _tabs[_selectedTab],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedLabelStyle: const TextStyle(height: 0.86),
        unselectedLabelStyle: const TextStyle(height: 0.86),
        items: [
          _bottomNavItem(Iconsax.coffee, "Dashboard"),
          _bottomNavItem(Iconsax.chart, "Logs"),
          _bottomNavItem(Iconsax.setting_2, "Settings"),
        ],
        onTap: (index) {
          setState(() => _selectedTab = index);
        },
        currentIndex: _selectedTab,
      ),
    );
  }

  _bottomNavItem(IconData icon, String label) {
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: Colors.grey[400],
        size: 26,
      ),
      activeIcon: Icon(
        icon,
        color: Constants.primaryColor,
        size: 26,
      ),
      label: label,
    );
  }

  final TextEditingController name = TextEditingController();
  final TextEditingController dailyGoal = TextEditingController();

  // Set user name
  _setUserName() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 28,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconHelper.closeIcon(context),
                  Text(
                    "Enter Your Name",
                    style: TextStyleHelper.hlText(
                      weight: FontWeight.w700,
                    ),
                  ),
                  IconHelper.doneIcon(() {
                    Navigator.pop(context);
                    _setWaterGoal();
                  }),
                ],
              ),
              const SizedBox(height: 60),
              TextField(
                controller: name,
                textAlign: TextAlign.center,
                style: TextStyleHelper.hllText(
                  weight: FontWeight.w700,
                ),
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  hintText: "e.g John",
                  hintStyle: TextStyleHelper.hllText(
                    weight: FontWeight.w700,
                    color: Colors.grey,
                  ),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
              const SizedBox(height: 70),
            ],
          ),
        );
      },
    );
  }

  // Sheet to set the water goal (first timers)
  _setWaterGoal() {
    // Store daily goal in database
    setDailyGoal() async {
      final user = User()
        ..dailyGoal = int.tryParse(dailyGoal.text)
        ..name = name.text;
      await context.read<SaveUserCubit>().saveUser(user);
    }

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 28,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconHelper.closeIcon(context),
                  Text(
                    "Set Daily Goal",
                    style: TextStyleHelper.hlText(
                      weight: FontWeight.w700,
                    ),
                  ),
                  IconHelper.doneIcon(() {
                    setDailyGoal();
                    Navigator.pop(context);
                  }),
                ],
              ),
              const SizedBox(height: 60),
              TextField(
                controller: dailyGoal,
                textAlign: TextAlign.center,
                style: TextStyleHelper.hllText(
                  weight: FontWeight.w700,
                ),
                decoration: InputDecoration(
                  hintText: "0.0",
                  hintStyle: TextStyleHelper.hllText(
                    weight: FontWeight.w700,
                  ),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
              Text(
                "ml (50oz)",
                style: TextStyleHelper.lgText(
                  weight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 70),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Metric(
                    value: "ml to oz",
                    btnColor: Constants.primaryColor,
                    textColor: Colors.white,
                  ),
                  const SizedBox(width: 16),
                  Metric(
                    value: "oz to ml",
                    btnColor: Colors.transparent,
                    textColor: Constants.primaryColor,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
