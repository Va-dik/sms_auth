import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sms_auth/src/features/home/data/datasources/interfaces/i_local_datasource.dart';
import 'package:sms_auth/src/features/home/data/models/account_model.dart';
import 'package:sms_auth/src/features/home/presentation/contants/shared_prefs_keys.dart';

class LocalDatasourceImpl implements ILocalDatasource {
  final SharedPreferences preferences;

  const LocalDatasourceImpl({required this.preferences});

  @override
  Future<AccountModel> getAccountData() async {
    final String jsonAccountData =
        preferences.getString(SharedPrefsKeys.accountDataKey) ?? '';

    if (jsonAccountData.isNotEmpty) {
      return Future.value(AccountModel.fromJson(jsonDecode(jsonAccountData)));
    } else {
      return AccountModel();
    }
  }

  @override
  Future<void> saveAccountData(AccountModel account) async {
    final String jsonAccountData = jsonEncode(account.toJson());

    await preferences.setString(SharedPrefsKeys.accountDataKey, jsonAccountData);
  }
}
