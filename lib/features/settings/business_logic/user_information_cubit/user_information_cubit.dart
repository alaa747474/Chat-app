import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:chat_app/features/settings/data/model/user_model.dart';
import 'package:chat_app/features/settings/data/repository/user_information_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'user_information_state.dart';

class UserInformationCubit extends Cubit<UserInformationState> {
  UserInformationCubit(this._userInformationRepository) : super(UserInformationInitial());
  final UserInformationRepository _userInformationRepository;
  getProfilePictureUrl({required File file}){
    _userInformationRepository.getProfilePictureUrl(file: file).then((imageUrl) {
      emit(UserProfilePicLoaded(imageUrl));
    });
  }
  saveUserData({required String name,required String email,}){
     UserModel userModel= UserModel(name, email,(state as UserProfilePicLoaded).imageUrl, FirebaseAuth.instance.currentUser!.phoneNumber.toString());
    _userInformationRepository.saveUserData(userModel: userModel).then((value) {
      emit(UserInformationSaved());
    });
  }
}
