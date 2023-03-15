import 'package:bloc/bloc.dart';
import 'package:chat_app/features/auth/data/repository/sign_in_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this._auth, this._signInRepository) : super(SignInInitial());
  final FirebaseAuth _auth;
  final SignInRepository _signInRepository;

  Future<void> signInWithPhone({required String phoneNumber}) async {
    await _signInRepository.verifyPhone(phoneNumber,
        completed: verificationCompleted,
        failed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
  }

  verificationCompleted(PhoneAuthCredential credential) async {
    await _auth.signInWithCredential(credential);
  }

  codeSent(String verificationId, int? forceRsendingToken) {
    emit(PhoneNumberSubmited(verificationId));
  }

  verificationFailed(FirebaseAuthException error) {
    debugPrint(error.message);
  }

  codeAutoRetrievalTimeout(verificationId) {}

  verifyOTP({required String smsCode, required String verificationId}) {
    try {
      emit(OTPVerificationLoading());
      _signInRepository
          .verifyOTP(verificationId: verificationId, smsCode: smsCode)
          .then((value) {
        emit(OTPVerified());
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  signOut() async {
    await _signInRepository.signOut().then((value) {
      emit(SignOutDone());
    });
  }
}
