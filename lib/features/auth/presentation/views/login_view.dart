import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tamenny_app/core/theme/app_colors.dart';
import 'package:tamenny_app/core/theme/app_styles.dart';
import 'package:tamenny_app/core/utils/app_assets.dart';
import 'package:tamenny_app/core/widgets/already_have_an_account.dart';

import '../../../../core/utils/login_custom_clipper.dart';
import '../../../../core/widgets/custom_app_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import 'widgets/login_form_section.dart';
import 'widgets/or_sign_in_with.dart';
import 'widgets/remember_me_widget.dart';
import 'widgets/social_media_methods.dart';
import 'widgets/terms_and_conditions.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ClipPath(
            clipper: CustomLogoClipper(),
            child: Container(
              height: MediaQuery.sizeOf(context).height * 0.15,
              width: double.infinity,
              color: AppColors.primaryColor,
              child: Center(
                child: SvgPicture.asset(
                  Assets.imagesLogoWhite,
                ),
              ),
            ),
          ),
          const LoginFormSection(),
        ],
      ),
    );
  }
}
