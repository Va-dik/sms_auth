import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sms_auth/src/features/home/components/enums/account_actions_enum.dart';
import 'package:sms_auth/src/features/home/presentation/bloc/account_bloc/account_bloc.dart';
import 'package:sms_auth/src/features/home/presentation/bloc/account_bloc/account_events.dart';
import 'package:sms_auth/src/features/home/presentation/bloc/account_bloc/account_state.dart';
import 'package:sms_auth/src/features/home/presentation/contants/home_colors_constant.dart';
import 'package:sms_auth/src/features/home/presentation/contants/home_icons_constant.dart';
import 'package:sms_auth/src/features/home/presentation/contants/home_strings_constants.dart';
import 'package:sms_auth/src/features/sign_up/presentation/constants/sign_up_colors_constant.dart';

class ProfilePhotoWidget extends StatelessWidget {
  const ProfilePhotoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountBloc, AccountState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            showCupertinoModalPopup(
              context: context,
              builder: (BuildContext popupContext) {
                return CupertinoActionSheet(
                  cancelButton: CupertinoActionSheetAction(
                    onPressed: () {
                      Navigator.pop(popupContext);
                    },
                    isDefaultAction: true,
                    child: const Text(HomeStringsConstant.closeText),
                  ),
                  title: const Text(HomeStringsConstant.selectPhotoText),
                  actions: [
                    CupertinoActionSheetAction(
                      onPressed: () {
                        context.read<AccountBloc>().add(
                            const AccountActionEvent(
                                accountAction:
                                    AccountActionsEnum.editPhotoCamera));
                        Navigator.pop(popupContext);
                      },
                      child: const Text(HomeStringsConstant.cameraPhotoText),
                    ),
                    CupertinoActionSheetAction(
                      onPressed: () {
                        context.read<AccountBloc>().add(
                            const AccountActionEvent(
                                accountAction:
                                    AccountActionsEnum.editPhotoGallery));
                        Navigator.pop(popupContext);
                      },
                      child: const Text(HomeStringsConstant.galleryPhotoText),
                    ),
                  ],
                );
              },
            );
          },
          child: Container(
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: HomeColorsConstant.photoBgColor,
              image:
                  state.account != null && state.account!.imagePath.isNotEmpty
                      ? DecorationImage(
                          image: FileImage(File('${state.account?.imagePath}')),
                          onError: (exception, stackTrace) =>
                              const Text('Ошибка загрузки фотографии'),
                          fit: BoxFit.fill,
                        )
                      : null,
            ),
            child: Stack(
              children: [
                state.account?.imagePath.isEmpty ?? true
                    ? const Center(
                        child: Icon(
                          HomeIconsConstant.photoPersonIcon,
                          color: HomeColorsConstant.personIconColor,
                          size: 80,
                        ),
                      )
                    : const SizedBox(),
                Align(
                  alignment: const Alignment(1.2, 1.1),
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: SignUpColorsConstant.scaffoldBgColor,
                    ),
                    child: const Icon(
                      HomeIconsConstant.ellipsisIcon,
                      size: 35,
                      color: HomeColorsConstant.ellipsisIconColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
