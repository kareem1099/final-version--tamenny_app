import 'package:flutter/material.dart';
import 'package:tamenny_app/core/widgets/custom_app_button.dart';
import 'package:tamenny_app/features/settings/presentation/views/widgets/settings_item.dart';

import '../../../../core/widgets/custom_app_bar.dart';

class SettingsLanguageView extends StatelessWidget {
  const SettingsLanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: 'Language'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Column(children: [
          SettingsItem(
            // leadingIcon: SvgPicture.asset(Assets.imagesNotificationIcon),
            title: 'Arab',
            onTap: () {},
          ),
          SettingsItem(
            // leadingIcon: SvgPicture.asset(Assets.imagesNotificationIcon),
            title: 'English',
            onTap: () {},
          ),
          Spacer(),
          CustomAppButton(text: 'Save', onTap: () {})
        ]),
      ),
    );
  }
}
