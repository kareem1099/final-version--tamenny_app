import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_styles.dart';
import '../../../../../core/widgets/custom_app_button.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../view_model/cubit/auth_cubit.dart';

class ForgotPasswordFormSection extends StatelessWidget {
  const ForgotPasswordFormSection({super.key});

  @override
  Widget build(BuildContext context) {
    var authCubit = BlocProvider.of<AuthCubit>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 14,
          ),
          Text(
            'Forgot Password',
            style: AppStyles.font24Bold.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            'At our app, we take the security of your information seriously.',
            style: AppStyles.font14Regular.copyWith(
              color: Color(0xff757575),
              letterSpacing: 1,
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          CustomTextFormField(
            hintText: 'Email or Phone Number',
            validate: (value) {
              if (value == null || value.isEmpty) {
                return 'Please Enter your Email';
              }
              return null;
            },
            onChanged: (data) {
              authCubit.email = data;
            },
          ),
          Expanded(
            child: const SizedBox(),
          ),
          CustomAppButton(
            text: 'Reset Password',
            onTap: () {
              authCubit.resetPassword();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Check Mail'),
                ),
              );
            },
          ),
          SizedBox(
            height: 26,
          ),
        ],
      ),
    );
  }
}
