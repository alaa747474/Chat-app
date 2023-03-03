import 'package:chat_app/features/auth/presentation/widgets/otp_text_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});
  static const String routeName = '/otp_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
    
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LottieBuilder.network('https://assets7.lottiefiles.com/packages/lf20_E5iNF8.json',fit: BoxFit.cover,width: 
            300.r,height: 250.r,),
            SizedBox(height: 25.h,),
            Text('Enter Code',style: Theme.of(context).textTheme.headline1,),
            SizedBox(height: 5.h,),
            Text('We\'ve sent the code to you',style: Theme.of(context).textTheme.headline4,),
            SizedBox(height: 20.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
            OTPTextField(),
            OTPTextField(),
            OTPTextField(),
            OTPTextField(),
            OTPTextField(),
            OTPTextField(isLast: true,),
            ],
            ),
          ],
        ),
      ),
    );
  }
}
