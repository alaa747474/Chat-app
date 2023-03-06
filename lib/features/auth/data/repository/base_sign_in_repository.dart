

abstract class BaseSignInRepository {

  Future verifyOTP({ required String smsCode,required String verificationId});
}
