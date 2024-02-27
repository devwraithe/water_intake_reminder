import 'package:flutter/material.dart';

import '../../core/helpers/constants.dart';
import '../../core/helpers/text_style_helper.dart';

class Metric extends StatelessWidget {
  const Metric({
    super.key,
    required this.value,
    required this.btnColor,
    required this.textColor,
  });

  final String value;
  final Color btnColor, textColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FilledButton(
        onPressed: () {},
        style: FilledButton.styleFrom(
          minimumSize: const Size(
            double.infinity,
            48.6,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(
              color: Constants.primaryColor,
              width: 1.4,
            ),
          ),
          backgroundColor: btnColor,
        ),
        child: Text(
          value,
          style: TextStyleHelper.mdText(
            weight: FontWeight.w500,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
