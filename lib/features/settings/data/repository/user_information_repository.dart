import 'dart:io';

import 'package:chat_app/core/services/firebase_storage_service.dart';
import 'package:chat_app/core/services/firestore_service.dart';
import 'package:chat_app/core/utils/contants.dart';
import 'package:chat_app/features/settings/data/model/user_model.dart';
import 'package:chat_app/features/settings/data/repository/base_user_information_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserInformationRepository extends BaseUserInformationRepository {
  final FirebaseStorageService _firebaseStorageService;
  final FirebaseAuth _auth;
  final FirestoreService _firestoreService;
  ConstantStrings strings = ConstantStrings.instance;
  UserInformationRepository(
      this._firebaseStorageService, this._auth, this._firestoreService);
  @override
  Future<String> getProfilePictureUrl({required File file}) {
    return _firebaseStorageService.saveFilesToFirebaseStorage(
        folderName: 'ProfilePic',
        imageName: 'profilePic${_auth.currentUser!.uid}',
        file: file);
  }

  @override
  Future<void> saveUserData({required UserModel userModel}) async {
    await _firestoreService.setDataToFirestore(
        collection: strings.usersCollection,
        data: userModel.toJson(),
        doc: _auth.currentUser!.uid);
  }
}
