import 'package:chat_app/features/auth/business_logic/country_picker_cubit/country_picker_cubit.dart';
import 'package:chat_app/features/auth/business_logic/sign_in_cubit/sign_in_cubit.dart';
import 'package:chat_app/features/auth/presentation/screens/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import '../widgets/auth_widgets.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
  static const String routeName = '/sign_in_screen';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController phoneNumberController = TextEditingController();
  late String phoneCode;
  @override
  void dispose() {
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: SingleChildScrollView(
          child: BlocBuilder<CountryPickerCubit, CountryPickerState>(
            builder: (context, state) {
              return Column(
                children: [
                  LottieBuilder.network(
                      'https://assets6.lottiefiles.com/packages/lf20_syHuxRsS8U.json'),
                  Text(
                    'Your Phone',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                      'please confirm your country code and enter your phone number',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headline3!
                          .copyWith(fontWeight: FontWeight.normal)),
                  SizedBox(
                    height: 10.h,
                  ),
                  const CustomDivider(),
                  BlocBuilder<CountryPickerCubit, CountryPickerState>(
                    builder: (context, state) {
                      if (state is CountryPicked) {
                        return CountryFlagNameRow(
                            onTap: () {
                              context
                                  .read<CountryPickerCubit>()
                                  .pickCountry(context);
                            },
                            countryName: state.countryName,
                            countryCode: state.countryCode);
                      }
                      return TextButton(
                          onPressed: () {
                            context
                                .read<CountryPickerCubit>()
                                .pickCountry(context);
                          },
                          child: Text(
                            'Select Country',
                            style: Theme.of(context).textTheme.bodyText1,
                          ));
                    },
                  ),
                  const CustomDivider(),
                  BlocBuilder<CountryPickerCubit, CountryPickerState>(
                    builder: (context, state) {
                      if (state is CountryPicked) {
                        phoneCode = state.phoneCode;
                        return PhoneNumberTextField(
                            controller: phoneNumberController,
                            phoneCode: state.phoneCode);
                      }
                      return const PhoneNumberHintText();
                    },
                  ),
                  const CustomDivider(),
                  SizedBox(
                    height: 20.h,
                  ),
                  BlocBuilder<CountryPickerCubit, CountryPickerState>(
                    builder: (context, state) {
                      if (state is CountryPicked) {
                        return BlocConsumer<SignInCubit, SignInState>(
                          listener: (context, state) {
                            if (state is PhoneNumberSubmited) {
                              Navigator.pushNamed(context, OTPScreen.routeName,arguments: state.verificationId);
                            }
                          },
                          builder: (context, state) {
                            return CustomButton(
                              text: 'Continue',
                              onPressed: () {
                                context.read<SignInCubit>().signInWithPhone(
                                    phoneNumber:
                                        '+$phoneCode${phoneNumberController.text}');
                              },
                            );
                          },
                        );
                      }
                      return const CustomButton(
                        text: 'Continue',
                        onPressed: null,
                      );
                    },
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
