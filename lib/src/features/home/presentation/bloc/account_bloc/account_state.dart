import 'package:sms_auth/src/core/components/enums/screen_states_enum.dart';
import 'package:sms_auth/src/features/home/data/models/account_model.dart';

class AccountState {
  final AccountModel? account;
  final ScreenStatesEnum screenState;

  const AccountState({
    this.account,
    this.screenState = ScreenStatesEnum.preload,
  });

  AccountState copyWith({
    AccountModel? account,
    ScreenStatesEnum? screenState,
  }) {
    return AccountState(
      account: account ?? this.account,
      screenState: screenState ?? this.screenState,
    );
  }
}

class AccountErrorState extends AccountState {
  final String errorMessage;

  const AccountErrorState({required this.errorMessage});
}
