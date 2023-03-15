import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseSignInRepository {
  Future<void> verifyPhone(String phone,
      {required void Function(PhoneAuthCredential)? completed,
      required void Function(FirebaseAuthException)? failed,
      required void Function(String, int?)? codeSent,
      required void Function(String)? codeAutoRetrievalTimeout});
  Future verifyOTP({required String smsCode, required String verificationId});
}
