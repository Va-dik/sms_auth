import 'package:sms_auth/src/core/components/enums/screen_states_enum.dart';

class SignUpState {
  final int step;
  final int stepLength = 3;
  final bool isButtonEnabled;
  final bool isSignUpPassed;
  final String? phoneNumber;
  final int timerDuration;
  final ScreenStatesEnum screenState;

  const SignUpState({
    this.step = 1,
    this.isButtonEnabled = false,
    this.isSignUpPassed = false,
    this.timerDuration = 60,
    this.phoneNumber,
    this.screenState = ScreenStatesEnum.ready,
  });

  SignUpState copyWith({
    int? step,
    bool? isButtonEnabled,
    bool? isSignUpPassed,
    int? timerDuration,
    String? phoneNumber,
    ScreenStatesEnum? screenState,
  }) {
    return SignUpState(
      step: step ?? this.step,
      isButtonEnabled: isButtonEnabled ?? this.isButtonEnabled,
      isSignUpPassed: isSignUpPassed ?? this.isSignUpPassed,
      timerDuration: timerDuration ?? this.timerDuration,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      screenState: screenState ?? this.screenState,
    );
  }
}

class ErrorSignInState extends SignUpState {
  final String errorMessage;

  ErrorSignInState({required this.errorMessage});
}
