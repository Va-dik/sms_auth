import 'package:sms_auth/src/features/home/data/datasources/interfaces/i_local_datasource.dart';
import 'package:sms_auth/src/features/home/data/models/account_model.dart';

class AccountDataUsecase {
  const AccountDataUsecase({required this.localDatasource});
  final ILocalDatasource localDatasource;

  Future<AccountModel> getAccountDataFromCache() async {
    return await localDatasource.getAccountData();
  }

  Future<void> saveAccountDataToCache(AccountModel account) async {
    return await localDatasource.saveAccountData(account);
  }
}
