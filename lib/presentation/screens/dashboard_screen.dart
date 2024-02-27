import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:water_intake_reminder/presentation/screens/tabs/home_tab.dart';
import 'package:water_intake_reminder/presentation/screens/tabs/logs_tab.dart';
import 'package:water_intake_reminder/presentation/screens/tabs/settings_tab.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _tabs[_selectedTab],
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
        color: Colors.lightBlueAccent,
        size: 26,
      ),
      label: label,
    );
  }
}
