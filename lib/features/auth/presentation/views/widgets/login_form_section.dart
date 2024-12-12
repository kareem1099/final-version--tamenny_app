import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tamenny_app/core/routes/routes.dart';
import 'package:tamenny_app/features/auth/presentation/view_model/cubit/auth_cubit.dart';
import 'package:tamenny_app/features/auth/presentation/view_model/cubit/auth_state.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_styles.dart';
import '../../../../../core/widgets/already_have_an_account.dart';
import '../../../../../core/widgets/custom_app_button.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import 'or_sign_in_with.dart';
import 'remember_me_widget.dart';
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
              ? Navigator.pushNamed(context, Routes.bottomNavBarView)
              : ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Please Verify Your Account'),
                  ),
                );
          ;
        } else if (state is LogInFailureState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errMessage),
            ),
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
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const RememberMeWidget(),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.forgotPasswordView);
                      },
                      child: Text(
                        'Forgot Password?',
                        style: AppStyles.font12Regular
                            .copyWith(color: AppColors.primaryColor),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                state is LogInLoadingState
                    ? Center(
                        child: const CircularProgressIndicator(
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
                AlreadyHaveAnAccount(),
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
