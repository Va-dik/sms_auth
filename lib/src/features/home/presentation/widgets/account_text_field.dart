// ignore_for_file: overridden_fields

import 'package:flutter/widgets.dart';
import 'package:sms_auth/src/core/presentation/widgets/custom_text_field.dart';
import 'package:sms_auth/src/features/home/presentation/contants/home_colors_constant.dart';

class AccountDataTextField extends CustomTextField {
  const AccountDataTextField({
    super.key,
    super.onChanged,
    this.placeholder,
    this.placeholderStyle,
    this.borderRadius,
    this.border = false,
  }) : super(
          placeholder: placeholder,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          border: border,
          color: HomeColorsConstant.myAccountTextFieldBgColor,
          borderRadius: borderRadius ??
              const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
        );

  @override
  final String? placeholder;
  @override
  final BorderRadius? borderRadius;
  @override
  final bool border;
  @override
  final TextStyle? placeholderStyle;
}
