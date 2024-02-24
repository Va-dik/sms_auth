import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sms_auth/src/core/components/extensions/list_extensions.dart';
import 'package:sms_auth/src/features/sign_up/presentation/bloc/sign_up_bloc.dart';
import 'package:sms_auth/src/features/sign_up/presentation/bloc/sign_up_events.dart';
import 'package:sms_auth/src/features/sign_up/presentation/constants/sign_up_strings_constant.dart';
import 'package:sms_auth/src/features/sign_up/presentation/pages/sign_up_page/2_sign_up_state_switcher.dart';
import 'package:sms_auth/src/features/sign_up/presentation/widgets/page_parts/body.dart';
import 'package:sms_auth/src/features/sign_up/presentation/widgets/page_parts/header.dart';
import 'package:sms_auth/src/features/sign_up/presentation/widgets/resend_button.dart';
import 'package:sms_auth/src/features/sign_up/presentation/widgets/sms_code_field.dart';

class ConfirmationStep extends StatelessWidget {
  const ConfirmationStep({super.key});

  @override
  Widget build(BuildContext context) {
    final smsCode =
        context.findAncestorWidgetOfExactType<SignUpStateSwitcher>()!.smsCode;
    return Column(
      children: [
        Header(
          title: SignUpStringsConstant.confirmation,
          actionText:
              '${SignUpStringsConstant.inputSmsCode} ${context.read<SignUpBloc>().state.phoneNumber}',
        ),
        Body(
          verticalPadding: 30,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int index = 0; index < 6; index++) ...{
                  SmsCodeField(
                    onChanged: (value) {
                      smsCode[index] = value;
                      if (smsCode.allElementsContainDigits()) {
                        context
                            .read<SignUpBloc>()
                            .add(ConfirmSmsCodeEvent(smsCode: smsCode.join()));
                      }

                      if (index > 0 && value.isEmpty) {
                        FocusScope.of(context).previousFocus();
                      } else if (index < 5 && value.isNotEmpty) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                  ),
                  // Space between sms-code fields
                  if (index < 5)
                    const SizedBox(
                      width: 15,
                    ),
                }
              ],
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 40),
                child: ResendButton(),
              ),
            )
          ],
        ),
      ],
    );
  }
}
