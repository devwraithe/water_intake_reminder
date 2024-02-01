import 'package:flutter/material.dart';

import '../helpers/text_style_helper.dart';

class CustomChip extends StatelessWidget {
  const CustomChip({
    super.key,
    required this.value,
  });

  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.lightBlueAccent,
        borderRadius: BorderRadius.circular(40),
      ),
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 6),
      child: Text(
        "${value}L",
        style: TextStyleHelper.mdText(
          color: Colors.white,
        ),
      ),
    );
  }
}
