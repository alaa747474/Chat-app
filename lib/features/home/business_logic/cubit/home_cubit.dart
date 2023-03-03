import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:chat_app/features/chat/presentation/screens/chat_screen.dart';
import 'package:chat_app/features/contacts/presentation/screens/contacts_screen.dart';
import 'package:chat_app/features/settings/presentation/screens/settings_screen.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  int selectedIndex = 0;
  List screens = [
   const ContactsScreen(),
   const ChatScreen(),
   const SettingsScreen()
  ];
  changeIndex(int index) {
    selectedIndex = index;
    emit(ChangeBottomNavIndex(selectedIndex));
  }
}
