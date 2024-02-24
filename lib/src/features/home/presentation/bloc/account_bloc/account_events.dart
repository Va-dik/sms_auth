import 'package:sms_auth/src/features/home/components/enums/account_actions_enum.dart';
import 'package:sms_auth/src/features/home/components/enums/account_data_management_enum.dart';
import 'package:sms_auth/src/features/home/data/models/account_model.dart';

abstract class AccountEvent {
  const AccountEvent();
}

final class AccountActionEvent extends AccountEvent {
  final AccountModel? account;
  final AccountActionsEnum accountAction;

  const AccountActionEvent({this.account, required this.accountAction});
}

final class AccountlDataManagementEvent extends AccountEvent {
  final AccountDataManagementEnum accountDataAction;

  const AccountlDataManagementEvent({required this.accountDataAction});
}
