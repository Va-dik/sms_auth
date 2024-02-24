import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:sms_auth/src/features/sign_up/presentation/bloc/sign_up_bloc.dart';
import 'package:sms_auth/src/features/sign_up/presentation/pages/sign_up_page/steps/confirmation_step.dart';
import 'package:sms_auth/src/features/sign_up/presentation/pages/sign_up_page/steps/sign_up_step.dart';
import 'package:sms_auth/src/features/sign_up/presentation/widgets/step_widget/step_widget.dart';

class SelectionStepPage extends StatelessWidget {
  const SelectionStepPage({
    super.key,
    required this.maskFormatter,
    required this.phoneNumberController,
  });

  final MaskTextInputFormatter maskFormatter;
  final TextEditingController phoneNumberController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StepsWidget(
          currentStep: context.read<SignUpBloc>().state.step,
          stepLength: context.read<SignUpBloc>().state.stepLength,
        ),
        if (context.read<SignUpBloc>().state.step == 1)
          SignUpStep(
            phoneNumberController: phoneNumberController,
            maskFormatter: maskFormatter,
          )
        else if (context.read<SignUpBloc>().state.step == 2)
          // ignore: prefer_const_constructors
          ConfirmationStep()
      ],
    );
  }
}
