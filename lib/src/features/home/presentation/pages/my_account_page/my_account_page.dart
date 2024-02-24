import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sms_auth/src/features/home/presentation/bloc/account_bloc/account_bloc.dart';
import 'package:sms_auth/src/features/home/presentation/bloc/home_bloc/bloc/home_bloc.dart';
import 'package:sms_auth/src/features/home/presentation/contants/home_colors_constant.dart';
import 'package:sms_auth/src/features/home/presentation/pages/my_account_page/account_page_config/account_state_switcher.dart';

class MyAccountPage extends StatelessWidget {
  const MyAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: HomeColorsConstant.myAccountScaffoldBgColor,
      navigationBar: CupertinoNavigationBar(
        leading: CupertinoButton(
          padding: const EdgeInsets.only(),
          onPressed: () {},
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.arrow_back_ios,
                color: HomeColorsConstant.appBarLeadingColor,
              ),
              Text(
                'Мой аккаунт',
                style: TextStyle(color: HomeColorsConstant.appBarLeadingColor),
              )
            ],
          ),
        ),
        middle: Text(
          context.read<HomeBloc>().state.pagesModel.pages[1].appBarTitle,
          style: const TextStyle(
            color: HomeColorsConstant.appBarTitleTextColor,
          ),
        ),
      ),
      child: BlocProvider<AccountBloc>(
        create: (context) => AccountBloc(),
        child: const AccountStateSwitcher(),
      ),
    );
  }
}
