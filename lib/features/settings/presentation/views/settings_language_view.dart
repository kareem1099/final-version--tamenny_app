import 'package:flutter/material.dart';
import 'package:tamenny_app/core/theme/app_colors.dart';

import '../../../../core/widgets/custom_app_bar.dart';

class SettingsLanguageView extends StatefulWidget {
  const SettingsLanguageView({super.key});

  @override
  State<SettingsLanguageView> createState() => _SettingsLanguageViewState();
}

class _SettingsLanguageViewState extends State<SettingsLanguageView> {
  String? language;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: 'Language'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Column(
          children: [
            RadioListTile(
              value: 'Arab',
              title: const Text('Arab'),
              groupValue: language,
              activeColor: AppColors.primaryColor,
              onChanged: (value) {
                setState(() {
                  language = value;
                });
              },
              controlAffinity: ListTileControlAffinity.trailing,
            ),
            Divider(
              thickness: 1,
              color: Colors.grey[200],
              endIndent: 20,
              indent: 20,
            ),
            RadioListTile(
              value: 'English',
              title: const Text('English'),
              activeColor: AppColors.primaryColor,
              groupValue: language,
              onChanged: (value) {
                setState(() {
                  language = value;
                });
              },
              controlAffinity: ListTileControlAffinity.trailing,
            ),
            Divider(
              thickness: 1,
              color: Colors.grey[200],
              endIndent: 20,
              indent: 20,
            ),
          ],
        ),
      ),
    );
  }
}
