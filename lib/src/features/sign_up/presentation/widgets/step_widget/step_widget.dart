import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sms_auth/src/features/sign_up/presentation/bloc/sign_up_bloc.dart';
import 'package:sms_auth/src/features/sign_up/presentation/widgets/custom_divider.dart';
import 'package:sms_auth/src/features/sign_up/presentation/widgets/step_widget/step_point.dart';

class StepsWidget extends StatelessWidget {
  const StepsWidget({super.key, required this.currentStep, required this.stepLength});
  final int currentStep;
  final int stepLength;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Building steps and dividers
        for (int index = 0; index < stepLength; index++) ...{
          StepPoint(
            step: index + 1,
            currentStep: currentStep,
          ),
          if (index < stepLength - 1) const CustomDivider()
        }
      ],
    );
  }
}
