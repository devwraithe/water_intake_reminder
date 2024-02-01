import 'package:flutter/material.dart';
import 'package:water_intake_reminder/core/helpers/text_style_helper.dart';
import 'package:water_intake_reminder/core/widgets/custom_button.dart';
import 'package:water_intake_reminder/core/widgets/custom_chip.dart';

import '../../core/widgets/cup_paint.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
              Container(
                width: 200.0,
                height: 300.0,
                child: CustomPaint(
                  painter: CupPainter(),
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
