import 'package:chat_app/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:chat_app/features/chat/presentation/screens/messages_screen.dart';
import 'package:chat_app/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRouter {
 static Route generateRoute(RouteSettings settings){
    switch (settings.name) {
      case SignInScreen.routeName:
      return MaterialPageRoute(builder: (_)=>const SignInScreen());
      case MessagesScreen.routeName:
      return MaterialPageRoute(builder: (_)=>const MessagesScreen());
    }
    return MaterialPageRoute(builder: (_)=>const HomeScreen());
  }
}