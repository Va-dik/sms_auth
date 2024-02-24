import 'package:sms_auth/src/features/home/data/models/account_model.dart';

abstract class IAccountRepository {
  Future<AccountModel> getAccountData();
  Future<void> saveAccountData();
}
