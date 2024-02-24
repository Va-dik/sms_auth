import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sms_auth/src/core/components/enums/screen_states_enum.dart';
import 'package:sms_auth/src/core/presentation/widgets/custom_error_widget.dart';
import 'package:sms_auth/src/core/presentation/widgets/custom_loading_widget.dart';
import 'package:sms_auth/src/features/home/components/enums/account_actions_enum.dart';
import 'package:sms_auth/src/features/home/components/enums/account_data_management_enum.dart';
import 'package:sms_auth/src/features/home/presentation/bloc/account_bloc/account_bloc.dart';
import 'package:sms_auth/src/features/home/presentation/bloc/account_bloc/account_events.dart';
import 'package:sms_auth/src/features/home/presentation/bloc/account_bloc/account_state.dart';
import 'package:sms_auth/src/features/home/presentation/contants/home_colors_constant.dart';
import 'package:sms_auth/src/features/home/presentation/contants/home_strings_constants.dart';
import 'package:sms_auth/src/features/home/presentation/pages/edit_data_page.dart';
import 'package:sms_auth/src/features/home/presentation/widgets/custom_list_tile.dart';
import 'package:sms_auth/src/features/home/presentation/widgets/profile_photo_widget.dart';

class AccountStateSwitcher extends StatelessWidget {
  const AccountStateSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AccountBloc, AccountState>(
      listenWhen: (previous, current) => previous.account != current.account,
      listener: (context, state) => context.read<AccountBloc>().add(
          const AccountlDataManagementEvent(
              accountDataAction: AccountDataManagementEnum.save)),
      builder: (context, state) {
        switch (state.screenState) {
          case ScreenStatesEnum.preload:
            context.read<AccountBloc>().add(const AccountlDataManagementEvent(
                accountDataAction: AccountDataManagementEnum.get));
            return const CustomLoadingWidget();
          case ScreenStatesEnum.error:
            return const CustomErrorWidget();
          case ScreenStatesEnum.isLoading:
            return const CustomLoadingWidget();
          case ScreenStatesEnum.ready:
            if (state.account != null) {
              return Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Column(
                  children: [
                    const ProfilePhotoWidget(),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text(
                        state.account!.email,
                        style: const TextStyle(
                          color: HomeColorsConstant.emailTextColor,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 30,
                      ),
                      child: Column(
                        children: [
                          CustomListTile(
                            title: HomeStringsConstant.nameText,
                            additionalInfo: state.account!.name,
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(13),
                            ),
                            onTap: () => Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (_) => EditDataPage(
                                  appBarTitle: HomeStringsConstant.yourNameText,
                                  leadingTitle: HomeStringsConstant.accountText,
                                  placeholder: HomeStringsConstant.yourNameText,
                                  onChanged: (value) =>
                                      context.read<AccountBloc>().add(
                                            AccountActionEvent(
                                              account: state.account?.copyWith(
                                                name: value,
                                              ),
                                              accountAction:
                                                  AccountActionsEnum.editName,
                                            ),
                                          ),
                                ),
                              ),
                            ),
                          ),
                          CustomListTile(
                            title: HomeStringsConstant.surnnameText,
                            additionalInfo: state.account!.lastName,
                            onTap: () => Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (_) => EditDataPage(
                                  appBarTitle:
                                      HomeStringsConstant.yourSurnameText,
                                  leadingTitle: HomeStringsConstant.accountText,
                                  placeholder:
                                      HomeStringsConstant.yourSurnameText,
                                  onChanged: (value) =>
                                      context.read<AccountBloc>().add(
                                            AccountActionEvent(
                                              account: state.account?.copyWith(
                                                lastName: value,
                                              ),
                                              accountAction: AccountActionsEnum
                                                  .editSurname,
                                            ),
                                          ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return const SizedBox();
            }
        }
      },
    );
  }
}
