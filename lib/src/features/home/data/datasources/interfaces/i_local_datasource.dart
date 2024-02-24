import 'package:sms_auth/src/features/home/data/models/account_model.dart';

abstract interface class ILocalDatasource {
  Future<AccountModel> getAccountData();
  Future<void> saveAccountData(AccountModel account);
}
