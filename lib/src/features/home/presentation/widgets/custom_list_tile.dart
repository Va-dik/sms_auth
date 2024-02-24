import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sms_auth/src/features/home/presentation/contants/home_colors_constant.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.title,
    required this.additionalInfo,
    this.borderRadius,
    required this.onTap,
  });

  final String title;
  final BorderRadius? borderRadius;
  final String additionalInfo;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: HomeColorsConstant.myAccountTextFieldBgColor,
      margin: const EdgeInsets.symmetric(vertical: 0.4),
      shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.zero),
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.zero,
        child: CupertinoListTile(
          backgroundColor: HomeColorsConstant.myAccountTextFieldBgColor,
          title: Text(
            title,
            style: const TextStyle(
              color: HomeColorsConstant.customListTileTitleColor,
            ),
          ),
          onTap: onTap,
          additionalInfo: Row(
            children: [
              Text(additionalInfo),
              const SizedBox(
                width: 10,
              ),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
