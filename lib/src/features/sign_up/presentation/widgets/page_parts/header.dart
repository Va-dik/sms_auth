import 'package:flutter/cupertino.dart';
import 'package:sms_auth/src/features/sign_up/presentation/constants/sign_up_colors_constant.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.title,
    required this.actionText,
  });

  final String title;
  final String actionText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Text(
            title,
            style: const TextStyle(
              color: SignUpColorsConstant.registrationTextColor,
              fontSize: 34,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.37,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Text(
            actionText,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: SignUpColorsConstant.registrationTextColor,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              height: 1.3,
            ),
          ),
        ),
      ],
    );
  }
}
