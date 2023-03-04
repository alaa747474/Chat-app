import 'package:chat_app/core/utils/service_locator.dart';
import 'package:chat_app/features/auth/business_logic/country_picker_cubit/country_picker_cubit.dart';
import 'package:chat_app/features/auth/business_logic/sign_in_cubit/sign_in_cubit.dart';
import 'package:chat_app/features/auth/presentation/screens/otp_screen.dart';
import 'package:chat_app/features/auth/presentation/screens/sign_in_screen.dart';
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
                create: (context) =>
                    getIt.get<SignInCubit>(),
              ),
            ],
            child: const SignInScreen(),
          ),
        );
      case MessagesScreen.routeName:
        return MaterialPageRoute(builder: (_) => const MessagesScreen());
      case OTPScreen.routeName:
      final verificatioId= settings.arguments as String;
        return MaterialPageRoute(
            builder: (_) =>  BlocProvider.value(
                  value: getIt.get<SignInCubit>(),
                  child:  OTPScreen(verificatioId: verificatioId,),
                ));
    }
    return MaterialPageRoute(builder: (_) => const HomeScreen());
  }
}
