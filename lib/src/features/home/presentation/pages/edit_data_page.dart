import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sms_auth/src/features/home/presentation/contants/home_colors_constant.dart';
import 'package:sms_auth/src/features/home/presentation/widgets/account_text_field.dart';

class EditDataPage extends StatelessWidget {
  const EditDataPage({
    super.key,
    required this.appBarTitle,
    required this.leadingTitle,
    required this.onChanged,
    required this.placeholder,
  });
  final String appBarTitle;
  final String leadingTitle;
  final String placeholder;
  final void Function(String value) onChanged;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: HomeColorsConstant.myAccountScaffoldBgColor,
      navigationBar: CupertinoNavigationBar(
        leading: CupertinoButton(
          onPressed: () => Navigator.pop(context),
          padding: const EdgeInsets.only(),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.arrow_back_ios),
              Text(leadingTitle),
            ],
          ),
        ),
        middle: Text(appBarTitle),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 12),
        child: AccountDataTextField(
          onChanged: onChanged,
          placeholder: placeholder,
          borderRadius: const BorderRadius.all(Radius.circular(13)),
          placeholderStyle: const TextStyle(
              color: HomeColorsConstant.myAccountTextFieldPlaceholderColor),
        ),
      ),
    );
  }
}
