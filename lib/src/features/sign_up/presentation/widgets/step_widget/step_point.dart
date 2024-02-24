import 'package:flutter/material.dart';
import 'package:sms_auth/src/features/sign_up/presentation/constants/sign_up_colors_constant.dart';
import 'package:sms_auth/src/features/sign_up/presentation/constants/sign_up_icons_constant.dart';

class StepPoint extends StatelessWidget {
  const StepPoint({super.key, required this.step, required this.currentStep});
  final int step;
  final int currentStep;
  final double size = 36;

  bool get isCurrent => currentStep == step;
  bool get isDone => currentStep > step;

  @override
  Widget build(BuildContext context) {
    return !isDone ? _buildColoredCircle() : SignUpIconsConstant.doneIcon;
  }

  Container _buildColoredCircle() {
    return Container(
      width: size,
      height: size,
      decoration: ShapeDecoration(
        color: isCurrent
            ? SignUpColorsConstant.stepPointBgActiveColor
            : SignUpColorsConstant.stepPointBgInactiveColor,
        shape: const OvalBorder(),
      ),
      child: Center(
        child: Text(
          step.toString(),
          style:
              const TextStyle(color: SignUpColorsConstant.stepPointTextColor),
        ),
      ),
    );
  }
}
