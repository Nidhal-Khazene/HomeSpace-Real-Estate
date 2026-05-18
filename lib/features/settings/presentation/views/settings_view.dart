import 'package:flutter/material.dart';
import 'package:home_space/constants.dart';
import 'package:home_space/features/settings/presentation/views/widgets/settings_view_body.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  static const routeName = "SettingsView";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: kPrimaryScreenPadding,
          child: SettingsViewBody(),
        ),
      ),
    );
  }
}
