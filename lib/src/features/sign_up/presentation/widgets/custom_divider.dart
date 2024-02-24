import 'package:flutter/cupertino.dart';
import 'package:sms_auth/src/features/sign_up/presentation/constants/sign_up_colors_constant.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 1,
      color: SignUpColorsConstant.dividerColor,
    );
  }
}
