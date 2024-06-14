import 'package:bookify/src/features/settings/presenter/pages/components/action_section.dart';
import 'package:bookify/src/features/settings/presenter/pages/components/header_section.dart';
import 'package:bookify/src/features/settings/presenter/pages/components/profile_option_section.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          HeaderSection(),
          SizedBox(height: 100),
          ProfileOptionsSection(),
          SizedBox(height: 20),
          ActionsSection(),
          SizedBox(height: 120),
        ],
      ),
    );
  }
}
