
abstract interface class ISignUpRepository {
  Future<void> sendPhoneNumber(String phoneNumber);
  Future<void> confirmSmsCode(String smsCode);
}
