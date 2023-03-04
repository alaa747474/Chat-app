part of 'sign_in_cubit.dart';

@immutable
abstract class SignInState {}

class SignInInitial extends SignInState {}

class PhoneNumberSubmited extends SignInState {
  final String verificationId;

  PhoneNumberSubmited(this.verificationId);
}

class OTPVerified extends SignInState {}

class OTPVerificationLoading extends SignInState {}

class SignOutDone extends SignInState {}
