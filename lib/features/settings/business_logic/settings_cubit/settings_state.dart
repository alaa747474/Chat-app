part of 'settings_cubit.dart';

@immutable
abstract class SettingsState {}

class SettingsInitial extends SettingsState {}
class ImageLoaded extends SettingsState {
  final File image;

  ImageLoaded(this.image);
}
