import 'package:firebase_auth/firebase_auth.dart';
import 'package:sms_auth/src/features/sign_up/domain/repositories/i_sign_up_repository.dart';

class SignUpRepositoryImpl implements ISignUpRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String verificationId = '';
  String phoneNumber = '';

  @override
  Future<void> sendPhoneNumber(String phoneNumber) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (phoneAuthCredential) async {
        await _auth.signInWithCredential(phoneAuthCredential);
      },
      verificationFailed: (error) => print(error),
      codeSent: (verificationId, forceResendingToken) {
        this.verificationId = verificationId;
      },
      codeAutoRetrievalTimeout: (verificationId) =>
          this.verificationId = verificationId,
      timeout: const Duration(seconds: 60),
    );
  }

  @override
  Future<void> confirmSmsCode(String smsCode) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsCode,
    );
    await _auth.signInWithCredential(credential);
  }
}
