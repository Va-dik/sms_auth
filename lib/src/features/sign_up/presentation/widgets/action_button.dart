import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sms_auth/src/features/sign_up/presentation/bloc/sign_up_bloc.dart';
import 'package:sms_auth/src/features/sign_up/presentation/bloc/sign_up_events.dart';
import 'package:sms_auth/src/features/sign_up/presentation/constants/sign_up_colors_constant.dart';
import 'package:sms_auth/src/features/sign_up/presentation/constants/sign_up_strings_constant.dart';
import 'package:sms_auth/src/features/sign_up/presentation/pages/sign_up_page/steps/sign_up_step.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    required this.isButtonEnabled,
  });

  final bool isButtonEnabled;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      color: SignUpColorsConstant.sendCodeButtonActiveColor,
      pressedOpacity: 0.6,
      disabledColor: SignUpColorsConstant.sendCodeButtonInactiveColor,
      onPressed: isButtonEnabled
          ? () {
              final String phoneNumber = context
                  .findAncestorWidgetOfExactType<SignUpStep>()!
                  .phoneNumberController
                  .text;
              context
                  .read<SignUpBloc>()
                  .add(SendPhoneNumberEvent(phoneNumber: phoneNumber));
              context.read<SignUpBloc>().add(const CountdownTimerEvent());
            }
          : null,
      child: const Text(
        SignUpStringsConstant.sendSmsCode,
        style: TextStyle(
          color: Color(0xFF4E4E4E),
          fontSize: 16,
          letterSpacing: 0.05,
        ),
      ),
    );
  }
}
