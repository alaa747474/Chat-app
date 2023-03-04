import 'package:flutter/cupertino.dart';

abstract class BaseSignInRepository {

  Future verifyOTP({ required String smsCode,required String verificationId});
}
