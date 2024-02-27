import 'package:flutter/material.dart';

import '../../../core/helpers/constants.dart';
import '../../../core/helpers/text_style_helper.dart';

class LogsTab extends StatefulWidget {
  const LogsTab({super.key});

  @override
  State<LogsTab> createState() => _LogsTabState();
}

class _LogsTabState extends State<LogsTab> {
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
              "Logs",
              style: TextStyleHelper.ds(),
            ),
            const SizedBox(height: 18),
            _logItem(),
            const SizedBox(height: 14),
            _logItem(),
            const SizedBox(height: 14),
            _logItem(),
            const SizedBox(height: 14),
            _logItem(),
            const SizedBox(height: 14),
            _logItem(),
            const SizedBox(height: 14),
            _logItem(),
            const SizedBox(height: 14),
            _logItem(),
            const SizedBox(height: 14),
            _logItem(),
          ],
        ),
      ),
    );
  }

  _logItem() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.grey[300]!,
          width: 1.4,
        ),
      ),
      padding: const EdgeInsets.fromLTRB(16, 16, 14, 16),
      child: Row(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "0.5L of Water",
                      style: TextStyleHelper.mdText(
                        weight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "Goal at 64%",
                      style: TextStyleHelper.mdText(
                        color: Colors.grey[600]!,
                      ),
                    ),
                  ],
                ),
                Text(
                  "08:20 PM",
                  style: TextStyleHelper.mdText(
                    weight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
