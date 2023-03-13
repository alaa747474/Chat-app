import 'package:chat_app/core/utils/service_locator.dart';
import 'package:chat_app/features/auth/business_logic/country_picker_cubit/country_picker_cubit.dart';
import 'package:chat_app/features/auth/business_logic/sign_in_cubit/sign_in_cubit.dart';
import 'package:chat_app/features/auth/presentation/screens/otp_screen.dart';
import 'package:chat_app/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:chat_app/features/chat/business_logic/bloc/chat_bloc.dart';
import 'package:chat_app/features/chat/data/repository/chat_repository.dart';
import 'package:chat_app/features/contacts/business_logic/logged_in_contacts_cubit/logged_in_contacts_cubit.dart';
import 'package:chat_app/features/saved_messages/business_logic/bloc/saved_messages_bloc.dart';
import 'package:chat_app/features/saved_messages/data/repository/saved_messages_repository.dart';
import 'package:chat_app/features/saved_messages/presentation/screens/saved_mesaages_screen.dart';
import 'package:chat_app/features/settings/business_logic/settings_cubit/settings_cubit.dart';
import 'package:chat_app/features/settings/business_logic/user_information_cubit/user_information_cubit.dart';
import 'package:chat_app/features/settings/data/model/user_model.dart';
import 'package:chat_app/features/settings/presentation/screens/user_information_screen.dart';
import 'package:chat_app/features/chat/presentation/screens/messages_screen.dart';
import 'package:chat_app/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SignInScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => CountryPickerCubit(),
              ),
              BlocProvider(
                create: (context) => getIt.get<SignInCubit>(),
              ),
            ],
            child: const SignInScreen(),
          ),
        );
      case UserInformationScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => SettingsCubit(),
              ),
              BlocProvider(
                create: (context) => getIt.get<UserInformationCubit>(),
              ),
            ],
            child: const UserInformationScreen(),
          ),
        );
      case SavedMessagesScreen.routeName:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) =>
                      SavedMessagesBloc(SaveMessagesRepository()),
                  child: const SavedMessagesScreen(),
                ));
      case MessagesScreen.routeName:
        final reciverUser = settings.arguments as UserModel;
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                    providers: [
                      BlocProvider.value(
                          value: ChatBloc(getIt.get<ChatRepository>())),
                      BlocProvider(
                        create: (context) => SavedMessagesBloc(SaveMessagesRepository())..add(LoadSavedMessage()),
                      )    
                    ],
                    child: MessagesScreen(
                      reviverUser: reciverUser,
                    )));
      case OTPScreen.routeName:
        final verificatioId = settings.arguments as String;
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider.value(
                      value: getIt.get<SignInCubit>(),
                    ),
                    BlocProvider(
                      create: (context) =>
                          getIt.get<LoggedInContactsCubit>()..getUsers(),
                    ),
                  ],
                  child: OTPScreen(
                    verificatioId: verificatioId,
                  ),
                ));
    }
    return MaterialPageRoute(builder: (_) => const HomeScreen());
  }
}
