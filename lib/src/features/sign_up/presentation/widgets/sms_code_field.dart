import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:sms_auth/src/features/sign_up/presentation/constants/sign_up_colors_constant.dart';

class SmsCodeField extends StatelessWidget {
  const SmsCodeField({super.key, required this.onChanged});

  final void Function(String value) onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      child: CupertinoTextField(
        onChanged: onChanged,
        cursorColor: SignUpColorsConstant.cursorColor,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 28),
        maxLength: 1,
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: SignUpColorsConstant.textFieldBorderColor,
              width: 2.3,
            ),
          ),
        ),
      ),
    );
  }
}
