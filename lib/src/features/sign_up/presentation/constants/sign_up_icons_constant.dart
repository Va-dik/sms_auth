import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sms_auth/src/features/sign_up/presentation/constants/sign_up_colors_constant.dart';

abstract class SignUpIconsConstant {
  static const doneIcon = Icon(
    CupertinoIcons.checkmark_alt_circle,
    color: SignUpColorsConstant.stepPointDoneIconColor,
    size: 40,
  );
  static const appBarLeadingIcon = Icon(
    Icons.arrow_back_ios_new,
    color: SignUpColorsConstant.appBarLeadingIconColor,
    size: 36,
  );
}
