import 'package:chat_app/features/auth/business_logic/sign_in_cubit/sign_in_cubit.dart';
import 'package:chat_app/features/auth/data/repository/sign_in_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

GetIt getIt =GetIt.instance;
void serviceLocatorSetUp(){
  getIt.registerSingleton<SignInCubit>(SignInCubit(FirebaseAuth.instance, SignInRepository(FirebaseAuth.instance)));
}