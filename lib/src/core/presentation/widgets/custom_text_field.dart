import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sms_auth/src/core/components/constants/core_colors_constant.dart';
import 'package:sms_auth/src/features/sign_up/presentation/constants/sign_up_colors_constant.dart';

class CustomTextField extends StatefulWidget {
  final Color? textColor;
  final bool border;
  final EdgeInsets? padding;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String value)? onChanged;
  final TextEditingController? controller;
  final BorderRadius? borderRadius;
  final Color? color;
  final String? placeholder;
  final TextStyle? placeholderStyle;

  const CustomTextField({
    Key? key,
    this.textColor = CoreColorsConstant.textFieldBorderDefaultColor,
    this.border = false,
    this.padding = const EdgeInsets.symmetric(vertical: 12),
    this.inputFormatters,
    this.onChanged,
    this.controller,
    this.textInputType,
    this.borderRadius,
    this.color = Colors.white,
    this.placeholder,
    this.placeholderStyle,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      inputFormatters: widget.inputFormatters,
      keyboardType: widget.textInputType,
      controller: widget.controller, // Используйте созданный контроллер
      padding: widget.padding!,
      placeholderStyle: widget.placeholderStyle,
      cursorColor: SignUpColorsConstant.cursorColor,
      placeholder: widget.placeholder,
      decoration: BoxDecoration(
        color: widget.color,
        border: widget.border
            ? Border.all(
                width: 1,
                color: isPressed
                    ? CoreColorsConstant.textFieldBorderPressedColor
                    : CoreColorsConstant.textFieldBorderDefaultColor,
              )
            : null,
        borderRadius: widget.borderRadius,
      ),
      onTap: widget.border ? () => setState(() => isPressed = true) : null,
      onSubmitted: (value) {
        setState(() => isPressed = false);
      },
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
        setState(() => isPressed = false);
      },
      onChanged: widget.onChanged,
    );
  }
}
