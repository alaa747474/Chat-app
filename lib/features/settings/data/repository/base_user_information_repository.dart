import 'dart:io';

import 'package:chat_app/features/settings/data/model/user_model.dart';

abstract class BaseUserInformationRepository{
  Future<String>getProfilePictureUrl({required File file});
  Future<void>saveUserData({required UserModel userModel});
}