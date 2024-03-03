import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

import 'constants.dart';

class IconHelper {
  static closeIcon(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Icon(
        TablerIcons.circle_x_filled,
        color: Constants.primaryColor,
        size: 26,
      ),
    );
  }

  static doneIcon(void Function()? onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Icon(
        TablerIcons.circle_check_filled,
        color: Constants.primaryColor,
        size: 26,
      ),
    );
  }
}
