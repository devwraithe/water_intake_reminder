import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:iconsax/iconsax.dart';
import 'package:water_intake_reminder/core/helpers/calculations_helpe.dart';
import 'package:water_intake_reminder/core/helpers/icon_helper.dart';
import 'package:water_intake_reminder/presentation/cubits/daily_goal/daily_goal_cubit.dart';
import 'package:water_intake_reminder/presentation/cubits/daily_goal/daily_goal_state.dart';
import 'package:water_intake_reminder/presentation/widgets/metric.dart';

import '../../../core/helpers/constants.dart';
import '../../../core/helpers/text_style_helper.dart';
import '../../../domain/entities/user.dart';
import '../../cubits/save_user/save_user_cubit.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  String? name;
  int? goal;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetUserCubit>(context).getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.primaryColor.withOpacity(0.1),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Settings",
              style: TextStyleHelper.ds(),
            ),
            const SizedBox(height: 24),
            _dailyGoal(),
            const SizedBox(height: 22),
            _metrics(),
          ],
        ),
      ),
    );
  }

  int dailyGoal = 0;
  final TextEditingController goalController = TextEditingController();

  _dailyGoal() {
    return GestureDetector(
      onTap: () => _setDailyGoal(),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.grey[300]!,
            width: 1.4,
          ),
        ),
        padding: const EdgeInsets.fromLTRB(16, 18, 14, 18),
        child: BlocListener<GetUserCubit, GetUserState>(
          listener: (context, state) {
            if (state is GetUserLoading) {
              debugPrint("Loading...");
            } else if (state is GetUserResponse) {
              setState(() {
                name = state.user.name;
                goal = state.user.dailyGoal;
                goalController.text = goal.toString();
              });
            } else if (state is GetUserError) {
              debugPrint("Daily Goal Error - ${state.message}");
            } else {
              debugPrint("Something went wrong...");
            }
          },
          child: Row(
            children: [
              Icon(
                Iconsax.cup,
                size: 36,
                color: Constants.primaryColor,
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name ?? "N/A",
                          style: TextStyleHelper.lgText(
                            weight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "Your Daily Goal: ${goal}ml",
                          style: TextStyleHelper.mdText(
                            color: Colors.grey[600]!,
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      TablerIcons.chevron_right,
                      color: Colors.grey[400]!,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Sheet to set daily goal
  _setDailyGoal() {
    // Store daily goal in database
    saveDailyGoal() async {
      final user = User()..dailyGoal = int.tryParse(goalController.text);
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
                    saveDailyGoal();
                    Navigator.pop(context);
                  }),
                ],
              ),
              const SizedBox(height: 60),
              TextField(
                controller: goalController,
                textAlign: TextAlign.center,
                style: TextStyleHelper.hllText(
                  weight: FontWeight.w700,
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
              Text(
                "ml (${CalculationsHelper.mlToOz(goal!.toDouble())}oz)",
                style: TextStyleHelper.lgText(
                  weight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 70),
            ],
          ),
        );
      },
    );
  }

  _metrics() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Colors.grey[300]!,
              width: 1.4,
            ),
          ),
          padding: const EdgeInsets.fromLTRB(16, 18, 14, 18),
          child: Column(
            children: [
              GestureDetector(
                onTap: () => _changeMetric(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Iconsax.rulerpen,
                          size: 22,
                          color: Constants.primaryColor,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          "Change metric unit",
                          style: TextStyleHelper.mdText(
                            color: Colors.black.withOpacity(0.8),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "ml (oz)",
                          style: TextStyleHelper.mdText(
                            color: Colors.grey[500]!,
                          ),
                        ),
                        const SizedBox(width: 2),
                        Icon(
                          TablerIcons.chevron_right,
                          size: 22,
                          color: Colors.grey[400]!,
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  // Sheet to change metric unit
  _changeMetric() {
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
                  Icon(
                    TablerIcons.circle_x_filled,
                    color: Constants.primaryColor,
                    size: 26,
                  ),
                  Text(
                    "Change Metric",
                    style: TextStyleHelper.hlText(
                      weight: FontWeight.w700,
                    ),
                  ),
                  Icon(
                    TablerIcons.circle_check_filled,
                    color: Constants.primaryColor,
                    size: 26,
                  ),
                ],
              ),
              const SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Metric(
                    value: "ml (oz)",
                    btnColor: Constants.primaryColor,
                    textColor: Colors.white,
                  ),
                  const SizedBox(width: 16),
                  Metric(
                    value: "oz (ml)",
                    btnColor: Colors.transparent,
                    textColor: Constants.primaryColor,
                  ),
                ],
              ),
              const SizedBox(height: 60),
            ],
          ),
        );
      },
    );
  }
}
