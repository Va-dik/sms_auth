abstract class SignUpEvent {
  const SignUpEvent();
}

class ConfirmSmsCodeEvent extends SignUpEvent {
  const ConfirmSmsCodeEvent({required this.smsCode});

  final String smsCode;
}

class UpdateSendCodeButtonStateEvent extends SignUpEvent {
  const UpdateSendCodeButtonStateEvent(this.phoneNumerLength);

  final int phoneNumerLength;
}

class ResendSmsCodeToUserEvent extends SignUpEvent {
  const ResendSmsCodeToUserEvent();
}

class CountdownTimerEvent extends SignUpEvent {
  const CountdownTimerEvent();
}

class GoBackStepEvent extends SignUpEvent {
  const GoBackStepEvent();
}

class SendPhoneNumberEvent extends SignUpEvent {
  const SendPhoneNumberEvent({required this.phoneNumber});

  final String phoneNumber;
}
