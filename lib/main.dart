import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:chat_app/core/router/app_router.dart';
import 'package:chat_app/core/utils/theme.dart';
import 'package:chat_app/features/auth/presentation/screens/sign_in_screen.dart';

import 'firebase_options.dart';

void main() async{
 
  runApp(const MyApp());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
getData();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: AppTheme.theme(),
            debugShowCheckedModeBanner: false,
            onGenerateRoute: AppRouter.generateRoute,
            initialRoute: SignInScreen.routeName,
          );
        });
  }
}
 getData()async{
 var c= await FirebaseFirestore.instance.collection('users').doc('87DMBSB121IwDEfKmvL4').get();
 Map<String, dynamic>? x= c.data();
 print(x!['name']);
 }