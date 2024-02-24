import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sms_auth/src/core/components/enums/screen_states_enum.dart';
import 'package:sms_auth/src/features/sign_up/domain/usecases/sign_up_usecase.dart';
import 'package:sms_auth/src/features/sign_up/presentation/bloc/sign_up_events.dart';
import 'package:sms_auth/src/features/sign_up/presentation/bloc/sign_up_states.dart';

final class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  late SignUpUsecase _signUpUsecase;

  SignUpBloc() : super(const SignUpState()) {
    on<GoBackStepEvent>(_goBackStep);
    on<SendPhoneNumberEvent>(_sendPhoneNumber);
    on<ConfirmSmsCodeEvent>(_confirmSmsCode);
    on<ResendSmsCodeToUserEvent>(_resendSmsCodeToUser);
    on<UpdateSendCodeButtonStateEvent>(_updateButtonState);
    on<CountdownTimerEvent>(_countdownTimer);
  }

  Future<void> _confirmSmsCode(
      ConfirmSmsCodeEvent event, Emitter<SignUpState> emit) async {
    await _signUpUsecase
        .confirmSmsCode(smsCode: event.smsCode)
        .then((value) => emit(state.copyWith(isSignUpPassed: true)))
        .onError((error, stackTrace) =>
            emit(state.copyWith(screenState: ScreenStatesEnum.error)));
  }

  Future<void> _sendPhoneNumber(
      SendPhoneNumberEvent event, Emitter<SignUpState> emit) async {
    _signUpUsecase = SignUpUsecase(phoneNumber: event.phoneNumber);
    await _signUpUsecase.sendPhoneNumber();
    emit(state.copyWith(step: 2, phoneNumber: event.phoneNumber));
  }

  Future<void> _resendSmsCodeToUser(
      ResendSmsCodeToUserEvent event, Emitter<SignUpState> emit) async {
    await _signUpUsecase.sendPhoneNumber().onError((error, stackTrace) =>
        emit(state.copyWith(screenState: ScreenStatesEnum.error)));
  }

  void _goBackStep(GoBackStepEvent event, Emitter<SignUpState> emit) {
    if (state.step > 1) {
      emit(state.copyWith(step: state.step - 1));
    }
  }

  void _updateButtonState(
      UpdateSendCodeButtonStateEvent event, Emitter<SignUpState> emit) {
    if (event.phoneNumerLength == 18) {
      emit(state.copyWith(isButtonEnabled: true));
    } else {
      emit(state.copyWith(isButtonEnabled: false));
    }
  }

  void _countdownTimer(
      CountdownTimerEvent event, Emitter<SignUpState> emit) async {
    emit(state.copyWith(timerDuration: 60));
    if (state.timerDuration == 60) {
      while (state.timerDuration > 0) {
        await Future.delayed(
          const Duration(milliseconds: 200),
          () => emit(state.copyWith(timerDuration: state.timerDuration - 1)),
        );
      }
    }
  }
}
