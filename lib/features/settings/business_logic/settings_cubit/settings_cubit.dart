import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:chat_app/core/utils/image_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());
  pickImage({required ImageSource source}){
    ImagePickerHelper.instance.pickImage(source).then((image){
      emit(ImageLoaded(image!));
    });
  
  }
}
