import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sms_auth/src/features/home/presentation/bloc/home_bloc/bloc/home_bloc.dart';
import 'package:sms_auth/src/features/home/presentation/bloc/home_bloc/bloc/home_event.dart';
import 'package:sms_auth/src/features/home/presentation/bloc/home_bloc/bloc/home_state.dart';
import 'package:sms_auth/src/features/home/presentation/contants/home_colors_constant.dart';
import 'package:sms_auth/src/features/home/presentation/pages/my_account_page/my_account_page.dart';
import 'package:sms_auth/src/features/home/components/enums/home_pages_enum.dart';
import 'package:sms_auth/src/features/home/presentation/pages/my_projects_page/my_projects_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => HomeBloc(),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return CupertinoTabScaffold(
            tabBar: CupertinoTabBar(
              activeColor: HomeColorsConstant.bottomNavActiveColor,
              border: const Border(top: BorderSide(width: 0.2)),
              inactiveColor: HomeColorsConstant.bottomNavInactiveColor,
              height: 60,
              backgroundColor: HomeColorsConstant.bottomNavBgColor,
              items: state.pagesModel.pages
                  .map(
                    (page) => BottomNavigationBarItem(
                        icon: page.navBarIcon,
                        activeIcon: page.navBarActiveIcon,
                        label: page.navBarLabel),
                  )
                  .toList(),
              onTap: (index) => context.read<HomeBloc>().add(
                    ChangePageEvent(page: HomePagesEnum.values[index]),
                  ),
            ),
            tabBuilder: (context, index) {
              late Widget tab;
              switch (state.currentPage) {
                case HomePagesEnum.myProjects:
                  tab = const MyProjectsPage();
                  break;
                case HomePagesEnum.myAccount:
                  tab = const MyAccountPage();
                  break;
              }
              return CupertinoTabView(builder: (context) => tab);
            },
          );
        },
      ),
    );
  }
}
