import 'package:flutter/material.dart';
import 'package:tamenny_app/features/settings/presentation/views/widgets/settings_item.dart';

import '../../../../core/widgets/custom_app_bar.dart';

class SettingsFaqView extends StatelessWidget {
  const SettingsFaqView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: 'FAQ'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Column(children: [
          SettingsItem(
            // leadingIcon: SvgPicture.asset(Assets.imagesNotificationIcon),
            title: 'What is Tamenny?',
            onTap: () {},
          ),
        ]),
      ),
    );
  }
}