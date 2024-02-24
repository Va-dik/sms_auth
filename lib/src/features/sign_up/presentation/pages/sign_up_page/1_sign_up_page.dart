import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sms_auth/src/features/sign_up/data/repositories/sign_up_repository_impl.dart';
import 'package:sms_auth/src/features/sign_up/presentation/bloc/sign_up_bloc.dart';
import 'package:sms_auth/src/features/sign_up/presentation/bloc/sign_up_events.dart';
import 'package:sms_auth/src/features/sign_up/presentation/constants/sign_up_icons_constant.dart';
import 'package:sms_auth/src/features/sign_up/presentation/pages/sign_up_page/2_sign_up_state_switcher.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final SignUpBloc signUpBloc = SignUpBloc();
    return BlocProvider<SignUpBloc>(
      create: (context) => signUpBloc,
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          border: null,
          leading: IconButton(
            icon: SignUpIconsConstant.appBarLeadingIcon,
            onPressed: () => signUpBloc.add(const GoBackStepEvent()),
          ),
        ),
        child: SingleChildScrollView(child: SignUpStateSwitcher()),
      ),
    );
  }
}
