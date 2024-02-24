import 'package:flutter/widgets.dart';
import 'package:sms_auth/src/features/home/presentation/contants/home_icons_constant.dart';

final class PageModel {
  PageModel({
    this.appBarTitle = '',
    this.navBarIcon,
    this.navBarActiveIcon,
    this.navBarLabel,
  });

  final String appBarTitle;
  final dynamic navBarIcon;
  final dynamic navBarActiveIcon;
  final String? navBarLabel;
}

final class PagesModel {
  final List<PageModel> pages = [
    PageModel(
      navBarIcon: Image.asset(
        HomeIconsConstant.myProjectsInactiveIcon,
        height: 30,
      ),
      navBarActiveIcon: Image.asset(
        HomeIconsConstant.myProjectsActiveIcon,
        height: 30,
      ),
      navBarLabel: 'Мои проекты',
    ),
    PageModel(
      appBarTitle: 'Аккаунт',
      navBarIcon: const Icon(HomeIconsConstant.photoPersonIcon),
      navBarLabel: 'Мой аккаунт',
    )
  ];
}
