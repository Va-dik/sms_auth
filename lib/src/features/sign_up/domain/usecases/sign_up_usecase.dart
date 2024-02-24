import 'package:sms_auth/src/features/sign_up/data/repositories/sign_up_repository_impl.dart';
import 'package:sms_auth/src/features/sign_up/domain/repositories/i_sign_up_repository.dart';

class SignUpUsecase {
  SignUpUsecase({required this.phoneNumber});
  
  final ISignUpRepository _signUpRepository = SignUpRepositoryImpl();
  final String phoneNumber;


  Future<void> sendPhoneNumber() async {
    return _signUpRepository.sendPhoneNumber(phoneNumber);
  }

  Future<void> confirmSmsCode({required String smsCode}) async {
    return _signUpRepository.confirmSmsCode(smsCode);
  }
}
