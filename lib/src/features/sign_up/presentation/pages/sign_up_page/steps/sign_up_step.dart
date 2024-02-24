import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:sms_auth/src/core/components/constants/core_colors_constant.dart';
import 'package:sms_auth/src/core/presentation/widgets/custom_text_field.dart';
import 'package:sms_auth/src/features/sign_up/presentation/bloc/sign_up_bloc.dart';
import 'package:sms_auth/src/features/sign_up/presentation/bloc/sign_up_events.dart';
import 'package:sms_auth/src/features/sign_up/presentation/constants/sign_up_colors_constant.dart';
import 'package:sms_auth/src/features/sign_up/presentation/constants/sign_up_strings_constant.dart';
import 'package:sms_auth/src/features/sign_up/presentation/widgets/action_button.dart';
import 'package:sms_auth/src/features/sign_up/presentation/widgets/page_parts/body.dart';
import 'package:sms_auth/src/features/sign_up/presentation/widgets/page_parts/header.dart';

class SignUpStep extends StatelessWidget {
  const SignUpStep({
    super.key,
    required this.maskFormatter,
    required this.phoneNumberController,
  });

  final MaskTextInputFormatter maskFormatter;
  final TextEditingController phoneNumberController;

  final String countryCode = '+7';

  void _showDialog(BuildContext context) {
    showCupertinoDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('Инфо'),
        content: const Text('Ваши персональные данные будут переданы.'),
        actions: [
          CupertinoButton(
            child: const Text('Ок'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Header(
          title: SignUpStringsConstant.registration,
          actionText: SignUpStringsConstant.inputNumForReg,
        ),
        Body(
          verticalPadding: 50,
          children: [
            const Text(
              SignUpStringsConstant.phoneNum,
              style: TextStyle(
                color: SignUpColorsConstant.phoneNumberTextColor,
                fontSize: 12,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: CustomTextField(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                placeholderStyle: const TextStyle(
                    color: CoreColorsConstant.textFieldPlaceholderColor,
                    fontSize: 17,
                    fontWeight: FontWeight.w400),
                textInputType: TextInputType.number,
                border: true,
                controller: phoneNumberController,
                inputFormatters: [maskFormatter],
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                onChanged: (value) {
                  if (!phoneNumberController.text.startsWith(countryCode)) {
                    phoneNumberController.text = '$countryCode ';
                  }
                  if (phoneNumberController.text.length >= 17) {
                    context.read<SignUpBloc>().add(
                        UpdateSendCodeButtonStateEvent(
                            phoneNumberController.text.length));
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 120),
              child: Center(
                child: ActionButton(
                  isButtonEnabled:
                      context.read<SignUpBloc>().state.isButtonEnabled,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: SignUpStringsConstant.personalDataInfo,
                  style: const TextStyle(
                      fontSize: 12,
                      color: SignUpColorsConstant.personalDataInfoTextColor),
                  children: [
                    TextSpan(
                      text: SignUpStringsConstant.personalData,
                      style: const TextStyle(
                          color: SignUpColorsConstant.personalDataTextColor),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => _showDialog(context),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
