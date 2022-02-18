import 'package:fathom_dnd/app/theme/app_colors.dart';
import 'package:fathom_dnd/app/theme/app_text_theme.dart';
import 'package:flutter/material.dart';

class DnDTextField extends StatelessWidget {
  const DnDTextField({
    Key? key,
    this.controller,
    this.label,
    this.errorText,
    this.hintText,
    this.helperText,
    this.enabled = true,
    this.validator,
    this.obscure = false,
    this.maxLines,
    this.maxLength,
    this.prefixIcon,
    this.onSubmit,
  }) : super(key: key);
  final TextEditingController? controller;
  final String? label;
  final String? errorText;
  final String? hintText;
  final String? helperText;
  final int? maxLines;
  final int? maxLength;
  final bool enabled;
  final bool obscure;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final Function(String)? onSubmit;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textAlign: label == null ? TextAlign.start : TextAlign.end,
      style: enabled
          ? AppTextTheme.textTheme.bodyText1?.copyWith(color: AppColors.white)
          : AppTextTheme.textTheme.bodyText1?.copyWith(
              color: AppColors.white.withOpacity(0.5),
            ),
      enabled: enabled,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      maxLines: obscure ? 1 : maxLines,
      maxLength: maxLength,
      obscureText: obscure,
      cursorColor: AppColors.purple,
      onFieldSubmitted: onSubmit,
      buildCounter: maxLength == null
          ? null
          : (
              BuildContext context, {
              required int currentLength,
              required int? maxLength,
              required bool isFocused,
            }) {
              return SizedBox(
                width: 100,
                child: ClipRRect(
                  clipBehavior: Clip.hardEdge,
                  borderRadius: BorderRadius.circular(20),
                  child: LinearProgressIndicator(
                    value: (currentLength == 0)
                        ? 0
                        : currentLength / ((maxLength! == 0) ? 1 : maxLength),
                    color: currentLength == maxLength
                        ? AppColors.yellow
                        : AppColors.darkGray,
                    backgroundColor: AppColors.gray.withOpacity(0.5),
                  ),
                ),
              );
            },
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        contentPadding: (maxLines == null || maxLines == 1)
            ? const EdgeInsets.symmetric(vertical: 5, horizontal: 16)
            : const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        prefixText: label,
        labelText: label,
        hintText: hintText,
        helperText: helperText,
        errorText: errorText,
        prefixIcon: prefixIcon,
        errorMaxLines: 2,
        errorStyle: AppTextTheme.textTheme.bodyText1?.copyWith(
          color: AppColors.red,
          fontWeight: FontWeight.normal,
          fontSize: 14,
        ),
        helperStyle: AppTextTheme.textTheme.bodyText1?.copyWith(
          color: AppColors.gray,
          fontWeight: FontWeight.normal,
          fontSize: 14,
        ),
        labelStyle: enabled
            ? AppTextTheme.textTheme.bodyText2?.copyWith(
                color: AppColors.grayLight,
              )
            : AppTextTheme.textTheme.bodyText2?.copyWith(
                color: AppColors.gray,
              ),
        hintStyle: AppTextTheme.textTheme.bodyText1?.copyWith(
          color: AppColors.purple,
        ),
        prefixStyle: enabled
            ? AppTextTheme.textTheme.bodyText2?.copyWith(
                color: AppColors.purple,
              )
            : AppTextTheme.textTheme.bodyText2?.copyWith(
                color: AppColors.gray,
              ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            width: 1.5,
            color: AppColors.purple,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            width: 1.5,
            color: AppColors.purple,
          ),
        ),
        filled: !enabled,
        fillColor: AppColors.gray.withOpacity(0.1),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            width: 1.5,
            color: AppColors.red.withOpacity(0.5),
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            width: 2,
            color: AppColors.red,
          ),
        ),
      ),
    );
  }
}
