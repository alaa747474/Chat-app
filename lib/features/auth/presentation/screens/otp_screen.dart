import 'package:chat_app/core/widgets/loading_indicator.dart';
import 'package:chat_app/features/auth/business_logic/sign_in_cubit/sign_in_cubit.dart';
import 'package:chat_app/features/settings/presentation/screens/user_information_screen.dart';
import 'package:chat_app/features/auth/presentation/widgets/auth_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key, required this.verificatioId});
  static const String routeName = '/otp_screen';
  final String verificatioId;
  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final TextEditingController firstController = TextEditingController();
  final TextEditingController secondController = TextEditingController();
  final TextEditingController thirdController = TextEditingController();
  final TextEditingController fourthController = TextEditingController();
  final TextEditingController fifthController = TextEditingController();
  final TextEditingController sixthcontroller = TextEditingController();
  @override
  void dispose() {
    firstController.dispose();
    secondController.dispose();
    thirdController.dispose();
    fourthController.dispose();
    fifthController.dispose();
    sixthcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LottieBuilder.network(
              'https://assets8.lottiefiles.com/private_files/lf30_z588h1j0.json',
              fit: BoxFit.cover,
              width: 250.r,
              height: 200.r,
            ),
            SizedBox(
              height: 25.h,
            ),
            Text(
              'Enter Code',
              style: Theme.of(context).textTheme.headline1,
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              'We\'ve sent the code to you',
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                OTPTextField(
                  controller: firstController,
                ),
                OTPTextField(
                  controller: secondController,
                ),
                OTPTextField(
                  controller: thirdController,
                ),
                OTPTextField(
                  controller: fourthController,
                ),
                OTPTextField(
                  controller: fifthController,
                ),
                OTPTextField(
                  isLast: true,
                  controller: sixthcontroller,
                ),
              ],
            ),
            BlocConsumer<SignInCubit, SignInState>(
              listener: (context, state) {
                if (state is OTPVerified) {
                  Navigator.pushReplacementNamed(context, UserInformationScreen.routeName);
                }
              },
              builder: (context, state) {
                if (state is OTPVerificationLoading) {
                  return const LoadingIndicator();
                }
                return CustomButton(
                    text: 'Verify',
                    onPressed: () {
                      context.read<SignInCubit>().verifyOTP(
                          verificationId: widget.verificatioId,
                          smsCode: firstController.text +
                              secondController.text +
                              thirdController.text +
                              fourthController.text +
                              fifthController.text +
                              sixthcontroller.text);
                    });
              },
            ),
          ],
        ),
      ),
    );
  }
}
