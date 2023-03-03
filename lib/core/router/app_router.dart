import 'package:chat_app/features/auth/business_logic/cubit/country_picker_cubit.dart';
import 'package:chat_app/features/auth/presentation/screens/otp_screen.dart';
import 'package:chat_app/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:chat_app/features/chat/presentation/screens/messages_screen.dart';
import 'package:chat_app/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
 static Route generateRoute(RouteSettings settings){
    switch (settings.name) {
      case SignInScreen.routeName:
      return MaterialPageRoute(builder: (_)=>BlocProvider(
        create: (context) => CountryPickerCubit(),
        child: const SignInScreen(),
      ));
      case MessagesScreen.routeName:
      return MaterialPageRoute(builder: (_)=>const MessagesScreen());
      case OTPScreen.routeName:
      return MaterialPageRoute(builder: (_)=>const OTPScreen());
    }
    return MaterialPageRoute(builder: (_)=>const HomeScreen());
  }
}