import 'package:flutter/material.dart';
import 'package:water_intake_reminder/core/helpers/text_style_helper.dart';
import 'package:water_intake_reminder/core/widgets/custom_button.dart';
import 'package:water_intake_reminder/core/widgets/custom_chip.dart';

import '../../../core/widgets/cup_paint.dart';

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
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: CustomButton(),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: CustomButton(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
