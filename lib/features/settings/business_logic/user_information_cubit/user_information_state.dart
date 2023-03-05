part of 'user_information_cubit.dart';

@immutable
abstract class UserInformationState {}

class UserInformationInitial extends UserInformationState {}
class UserProfilePicLoaded extends UserInformationState {
  final String imageUrl;

  UserProfilePicLoaded(this.imageUrl);
}
class UserInformationSaved extends UserInformationState {}

