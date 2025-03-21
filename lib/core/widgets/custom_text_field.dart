import 'package:flutter/material.dart';
import 'package:tamenny_app/core/theme/app_colors.dart';
import 'package:tamenny_app/core/theme/app_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, required this.hintText, this.onChanged, this.validate});
  final String hintText;
  final Function(String)? onChanged;
  final String? Function(String?)? validate;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText:hintText=="Password"?true:false,
      onChanged: onChanged,
      validator: validate,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppStyles.font14Medium.copyWith(
          color: const Color(0xffC2C2C2),
        ),
        fillColor: AppColors.grayColor,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.deepGrayColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.deepGrayColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.deepGrayColor),
        ),
      ),
    );
  }
}
