import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'user_auth_state.dart';

class UserAuthCubit extends Cubit<UserAuthState> {
  UserAuthCubit() : super(UserAuthInitial());
   getUserState(){
    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user!=null) {
        emit(UserLoggedInState(true));
      }else{
        emit(UserLoggedInState(false));
      }
     });
  }
}
