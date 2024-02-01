import 'package:flutter/material.dart';
import 'package:water_intake_reminder/core/helpers/text_style_helper.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.lightBlueAccent,
          width: 1.26,
        ),
        borderRadius: BorderRadius.circular(10),
        color: Colors.lightBlueAccent.withOpacity(0.4),
      ),
      padding: const EdgeInsets.only(
        top: 17,
        bottom: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Water (8oz)",
            style: TextStyleHelper.mdText(
              weight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
