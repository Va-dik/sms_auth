import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sms_auth/src/features/sign_up/presentation/bloc/sign_up_bloc.dart';
import 'package:sms_auth/src/features/sign_up/presentation/bloc/sign_up_events.dart';
import 'package:sms_auth/src/features/sign_up/presentation/constants/sign_up_colors_constant.dart';
import 'package:sms_auth/src/features/sign_up/presentation/constants/sign_up_strings_constant.dart';

class ResendButton extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  ResendButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (context.read<SignUpBloc>().state.timerDuration == 0) {
      return CupertinoButton(
          child: const Text(
            SignUpStringsConstant.resendtSmsCode,
            style: TextStyle(
              color: SignUpColorsConstant.stepPointBgActiveColor,
              wordSpacing: 2,
            ),
          ),
          onPressed: () {
            context.read<SignUpBloc>().add(const ResendSmsCodeToUserEvent());
            context.read<SignUpBloc>().add(const CountdownTimerEvent());
          });
    } else {
      return Text(
        '${context.read<SignUpBloc>().state.timerDuration} ${SignUpStringsConstant.timeRemaining}',
      );
    }
  }
}
