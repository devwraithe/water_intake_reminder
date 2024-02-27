import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:water_intake_reminder/core/helpers/text_style_helper.dart';
import 'package:water_intake_reminder/core/widgets/custom_button.dart';
import 'package:water_intake_reminder/core/widgets/custom_chip.dart';

import '../../../core/widgets/cup_paint.dart';
import '../../widgets/metric.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});
  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "16th June 2023",
                style: TextStyleHelper.mdText(),
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "H2O Goal",
                    style: TextStyleHelper.hlText(
                      weight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const CustomChip(value: "20"),
                ],
              ),
              const Spacer(),
              SizedBox(
                width: 200.0,
                height: 300.0,
                child: CustomPaint(
                  painter: CupPainter(),
                  child: Container(
                    margin: const EdgeInsets.only(top: 6),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "10 of 30ml",
                          style: TextStyleHelper.lgText(
                            weight: FontWeight.w900,
                          ),
                        ),
                        Text(
                          "consumed",
                          style: TextStyleHelper.mdText(
                            weight: FontWeight.w500,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Text(
                "You reached 50% of your goal",
                textAlign: TextAlign.center,
                style: TextStyleHelper.lgText(),
              ),
              const SizedBox(height: 26),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Expanded(
                    child: CustomButton(),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: CustomButton(
                      onPressed: () => _setWaterGoal(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Sheet to change metric unit
  _customIntake() {
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
                  const Icon(
                    TablerIcons.circle_x_filled,
                    color: Colors.lightBlueAccent,
                    size: 26,
                  ),
                  Text(
                    "Record Your Intake",
                    style: TextStyleHelper.hlText(
                      weight: FontWeight.w700,
                    ),
                  ),
                  const Icon(
                    TablerIcons.circle_check_filled,
                    color: Colors.lightBlueAccent,
                    size: 26,
                  ),
                ],
              ),
              const SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "1,478",
                    style: TextStyleHelper.hllText(
                      weight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "ml",
                    style: TextStyleHelper.hllText(
                      weight: FontWeight.w700,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              Text(
                "(50oz)",
                style: TextStyleHelper.lgText(
                  weight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 70),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Expanded(
                    child: CustomButton(),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: CustomButton(
                      onPressed: () => _customIntake(),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Expanded(
                    child: CustomButton(),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: CustomButton(
                      onPressed: () => _customIntake(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  // Sheet to set the water goal (first timers)
  _setWaterGoal() {
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
                  const Icon(
                    TablerIcons.circle_x_filled,
                    color: Colors.lightBlueAccent,
                    size: 26,
                  ),
                  Text(
                    "Set Daily Goal",
                    style: TextStyleHelper.hlText(
                      weight: FontWeight.w700,
                    ),
                  ),
                  const Icon(
                    TablerIcons.circle_check_filled,
                    color: Colors.lightBlueAccent,
                    size: 26,
                  ),
                ],
              ),
              const SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "1,478",
                    style: TextStyleHelper.hllText(
                      weight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "ml",
                    style: TextStyleHelper.hllText(
                      weight: FontWeight.w700,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              Text(
                "(50oz)",
                style: TextStyleHelper.lgText(
                  weight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 70),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Metric(
                    value: "ml to oz",
                    btnColor: Colors.lightBlueAccent,
                    textColor: Colors.white,
                  ),
                  SizedBox(width: 16),
                  Metric(
                    value: "oz to ml",
                    btnColor: Colors.transparent,
                    textColor: Colors.lightBlueAccent,
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
