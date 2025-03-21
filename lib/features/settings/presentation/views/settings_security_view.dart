import 'package:flutter/material.dart';
import 'package:tamenny_app/features/settings/presentation/views/widgets/settings_item.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_app_switch.dart';

class SettingsSecurityView extends StatelessWidget {
  const SettingsSecurityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: 'Security'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Column(children: [
          SettingsItem(
            title: 'Remember password',
            onTap: () {},
            trailingIcon: const CustomAppSwitch(),
          ),
          SettingsItem(
            title: 'Face ID',
            onTap: () {},
            trailingIcon: const CustomAppSwitch(),
          ),
          SettingsItem(
            title: 'PIN',
            onTap: () {},
            trailingIcon: const CustomAppSwitch(),
          ),
          SettingsItem(
            title: 'Google Authenticator',
            onTap: () {},
            trailingIcon: const CustomAppSwitch(),
          ),
        ]),
      ),
    );
  }
}
