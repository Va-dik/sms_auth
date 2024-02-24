import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sms_auth/src/features/home/presentation/bloc/home_bloc/bloc/home_bloc.dart';

class MyProjectsPage extends StatelessWidget {
  const MyProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(context.read<HomeBloc>().state.pagesModel.pages[0].appBarTitle),
      ),
      child: const SizedBox(),
    );
  }
}
