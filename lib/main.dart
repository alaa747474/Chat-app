import 'package:chat_app/core/utils/service_locator.dart';
import 'package:chat_app/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:chat_app/features/chat/data/model/message.dart';
import 'package:chat_app/features/home/presentation/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:chat_app/core/router/app_router.dart';
import 'package:chat_app/core/utils/theme.dart';
import 'package:hive_flutter/adapters.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  serviceLocatorSetUp();
  Hive.registerAdapter(MessageAdapter());
  runApp(const MyApp());
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
            initialRoute: FirebaseAuth.instance.currentUser == null
                ? SignInScreen.routeName
                : HomeScreen.routeName,
          );
        });
  }
}
