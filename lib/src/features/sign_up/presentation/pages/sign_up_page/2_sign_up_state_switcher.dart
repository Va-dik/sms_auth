import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:sms_auth/src/core/components/enums/screen_states_enum.dart';
import 'package:sms_auth/src/core/presentation/widgets/custom_error_widget.dart';
import 'package:sms_auth/src/core/presentation/widgets/custom_loading_widget.dart';
import 'package:sms_auth/src/features/home/presentation/pages/home_page/home_page.dart';
import 'package:sms_auth/src/features/sign_up/presentation/bloc/sign_up_bloc.dart';
import 'package:sms_auth/src/features/sign_up/presentation/bloc/sign_up_states.dart';
import 'package:sms_auth/src/features/sign_up/presentation/pages/sign_up_page/3_selection_step_page.dart';

class SignUpStateSwitcher extends StatelessWidget {
  SignUpStateSwitcher({super.key});

  final TextEditingController _phoneNumberController =
      TextEditingController(text: '+375 ');

  final MaskTextInputFormatter _maskFormatter = MaskTextInputFormatter(
    mask: '+375 (##) ### ## ##',
    filter: {'#': RegExp(r'[0-9]')},
  );
  final List<String> smsCode = ['', '', '', '', '', ''];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(builder: (context, state) {
      switch (state.screenState) {
        case ScreenStatesEnum.preload:
          return const SizedBox();
        case ScreenStatesEnum.error:
          return const CustomErrorWidget();
        case ScreenStatesEnum.isLoading:
          return const CustomLoadingWidget();
        case ScreenStatesEnum.ready:
          if (state.isSignUpPassed) {
            Future.delayed(
              Duration.zero,
              () => Navigator.pushReplacement(context,
                  CupertinoPageRoute(builder: (context) => const HomePage())),
            );
          }
          return SelectionStepPage(
            phoneNumberController: _phoneNumberController,
            maskFormatter: _maskFormatter,
          );
      }
    });
  }
}
