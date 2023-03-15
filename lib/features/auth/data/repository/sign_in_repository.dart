import 'package:firebase_auth/firebase_auth.dart';

import 'base_sign_in_repository.dart';

class SignInRepository extends BaseSignInRepository {
  final FirebaseAuth _auth;

  SignInRepository(this._auth);

  @override
  verifyOTP({required String smsCode, required String verificationId}) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: smsCode);
    await _auth.signInWithCredential(credential);
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  @override
   Future<void> verifyPhone(String phone,
      {required void Function(PhoneAuthCredential)? completed,
      required void Function(FirebaseAuthException)? failed,
      required void Function(String, int?)? codeSent,
      required void Function(String)? codeAutoRetrievalTimeout}) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phone,
        verificationCompleted: completed!,
        verificationFailed: failed!,
        codeSent: codeSent!,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout!);
  }
}
