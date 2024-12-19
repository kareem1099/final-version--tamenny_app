import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tamenny_app/features/auth/presentation/view_model/cubit/auth_cubit.dart';
import 'package:tamenny_app/features/auth/presentation/view_model/cubit/auth_state.dart';
import 'package:tamenny_app/features/auth/presentation/views/widgets/remember_me_and_forgot_password.dart';

import '../../../../../core/functions/show_toast_message.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_styles.dart';
import '../../../../../core/widgets/custom_app_button.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../core/widgets/dont_have_an_account.dart';
import '../functions/login_navigation_with_toast_message.dart';
import 'or_sign_in_with.dart';
import 'social_media_methods.dart';
import 'terms_and_conditions.dart';

class LoginFormSection extends StatelessWidget {
  const LoginFormSection({super.key});

  @override
  Widget build(BuildContext context) {
    var authCubit = BlocProvider.of<AuthCubit>(context);
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LogInSuccessState) {
          FirebaseAuth.instance.currentUser!.emailVerified
              ? loginWithMessage(
                  context: context,
                  msg: 'You have successfully logged in.',
                  backgroundColor: Colors.green,
                )
              : showToastMessage(
                  msg: 'Please Verify Your Account',
                  backgroundColor: Colors.red,
                );
        } else if (state is LogInFailureState) {
          showToastMessage(
            msg: state.errMessage,
            backgroundColor: Colors.red,
          );
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: authCubit.loginFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 14,
                ),
                Text(
                  'Welcome Back',
                  style: AppStyles.font24Bold
                      .copyWith(color: AppColors.primaryColor),
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextFormField(
                  hintText: 'Email',
                  onChanged: (data) {
                    authCubit.email = data;
                  },
                  validate: (value) {
                    final emailRegex = RegExp(
                        r'^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$');
                    if (value == null || value.isEmpty) {
                      return 'Email is required.';
                    }
                    if (!emailRegex.hasMatch(value)) {
                      return 'Enter a valid email address.';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomTextFormField(
                  hintText: 'Password',
                  onChanged: (data) {
                    authCubit.password = data;
                  },
                  validate: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password is required.';
                    }
                    if (value.length < 8) {
                      return 'Password must be at least 8 characters long.';
                    }
                    final passwordRegex = RegExp(
                        r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&]).{8,}$');
                    if (!passwordRegex.hasMatch(value)) {
                      return 'Password must include uppercase, lowercase, number, and special character.';
                    }
                    return null;
                  },
                  obscure: authCubit.obsecure,
                  suffixIcon: IconButton(
                    onPressed: () {
                      authCubit.changeObsecureState();
                    },
                    icon: Icon(
                      authCubit.obsecure == false
                          ? Icons.remove_red_eye
                          : Icons.visibility_off,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const RememberMeWidgetAndForgotPassword(),
                const SizedBox(
                  height: 32,
                ),
                state is LogInLoadingState
                    ? const Center(
                        child:  CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        ),
                      )
                    : CustomAppButton(
                        text: 'Login',
                        onTap: () {
                          if (authCubit.loginFormKey.currentState!.validate()) {
                            authCubit.loginWithEmailAndPassword();
                          }
                        },
                      ),
                const SizedBox(
                  height: 46,
                ),
                const OrSignInWith(),
                const SizedBox(
                  height: 32,
                ),
                const SocialMediaMethods(),
                const SizedBox(
                  height: 32,
                ),
                const TermsAndConditionsAndPrivacyPolicy(),
                const SizedBox(
                  height: 24,
                ),
                const DontHaveAnAccount(),
                const SizedBox(
                  height: 24,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

